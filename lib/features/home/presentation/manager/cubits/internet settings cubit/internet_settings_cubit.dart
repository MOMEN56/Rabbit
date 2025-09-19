import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_test_plus/flutter_speed_test_plus.dart';
import 'package:dart_ping/dart_ping.dart';

part 'internet_settings_state.dart';

class InternetSettingsCubit extends Cubit<InternetSettingsState> {
  InternetSettingsCubit() : super(const InternetSettingsInitial());

  final FlutterInternetSpeedTest _internetSpeedTest =
      FlutterInternetSpeedTest()..enableLog();

  String? _ip;
  String? get ip => _ip;

  Future<void> startTest() async {
    int pingValue = await _measurePing();

    await _internetSpeedTest.startTesting(
      onStarted: () {
        emit(InternetDownloadInProgress(downloadRate: 0, downloadProgress: 0));
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
        emit(const InternetTestCancelled()); // 👈 حالة جديدة
      },
    );
  }

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
    final avg = times.reduce((a, b) => a + b) ~/ times.length;
    return avg;
  }

  void reset() {
    emit(const InternetSettingsInitial());
  }

  void cancelTest() {
    _internetSpeedTest.cancelTest();
    emit(const InternetTestCancelled()); // 👈 بدل Initial
  }
}
