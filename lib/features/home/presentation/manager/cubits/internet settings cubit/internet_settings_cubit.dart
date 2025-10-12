import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_test_plus/flutter_speed_test_plus.dart';
import 'package:dart_ping/dart_ping.dart';
import 'package:equatable/equatable.dart';

part 'internet_settings_state.dart';

class InternetSettingsCubit extends Cubit<InternetSettingsState> {
  InternetSettingsCubit() : super(const InternetSettingsInitial());

  FlutterInternetSpeedTest _internetSpeedTest =
      FlutterInternetSpeedTest()..enableLog();

  String? _ip;
  String? get ip => _ip;

  /// يبدأ اختبار السرعة
  Future<void> startTest() async {
    // نعيد إنشاء كائن الاختبار كل مرة للتأكد من عدم وجود listeners قديمة
    _internetSpeedTest = FlutterInternetSpeedTest()..enableLog();

    int pingValue = await _measurePing();

    await _internetSpeedTest.startTesting(
      onStarted: () {
        emit(
          const InternetDownloadInProgress(
            downloadRate: 0,
            downloadProgress: 0,
          ),
        );
      },
      onProgress: (percent, data) async {
        if (data.type == TestType.download) {
          emit(
            InternetDownloadInProgress(
              downloadRate: data.transferRate,
              downloadProgress: percent,
            ),
          );
        } else if (data.type == TestType.upload) {
          emit(
            InternetUploadInProgress(
              uploadRate: data.transferRate,
              uploadProgress: percent,
              downloadRate: state.downloadRate,
            ),
          );
        }
      },
      onCompleted: (download, upload) {
        emit(
          InternetTestCompleted(
            downloadRate: download.transferRate,
            uploadRate: upload.transferRate,
            ping: pingValue,
            bool6Sec: true,
          ),
        );

        // بعد 6 ثواني يتم إظهار زر البداية مرة أخرى
        Future.delayed(const Duration(seconds: 6), () {
          emit(
            InternetTestCompleted(
              downloadRate: download.transferRate,
              uploadRate: upload.transferRate,
              ping: pingValue,
              bool6Sec: false,
            ),
          );
        });
      },
      onDefaultServerSelectionInProgress: () {},
      onDefaultServerSelectionDone: (client) {
        _ip = client?.ip ?? "0.0.0.0";
        emit(state);
      },
      onError: (errorMessage, error) {
        emit(const InternetSettingsInitial());
      },
      onCancel: () {
        emit(const InternetTestCancelled());
      },
    );
  }

  /// يقيس ping
  Future<int> _measurePing() async {
    final ping = Ping('8.8.8.8', count: 3);
    final List<int> times = [];

    await for (final event in ping.stream) {
      if (event.response != null) {
        final time = event.response!.time?.inMilliseconds;
        if (time != null) times.add(time);
      }
      if (event.summary != null) break;
    }

    if (times.isEmpty) return 0;
    return times.reduce((a, b) => a + b) ~/ times.length;
  }

  /// إعادة تعيين الـ state إلى Initial
  void reset() {
    emit(const InternetSettingsInitial());
  }

  /// إلغاء الاختبار الحالي
  void cancelTest() {
    try {
      _internetSpeedTest.cancelTest();
    } catch (_) {}
    emit(const InternetTestCancelled());
  }
}
