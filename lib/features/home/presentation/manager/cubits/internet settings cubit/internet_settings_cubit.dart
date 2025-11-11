import 'dart:async';
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

  // ✅ المتغيرات الجديدة للكشف عن التوقف
  Timer? _timeoutTimer;
  double _lastDownload = -1;
  double _lastUpload = -1;

  Future<void> startTest() async {
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

          _checkStuckCondition(data.transferRate, 0); // 👈 NEW
        } else if (data.type == TestType.upload) {
          emit(
            InternetUploadInProgress(
              uploadRate: data.transferRate,
              uploadProgress: percent,
              downloadRate: state.downloadRate,
            ),
          );

          _checkStuckCondition(state.downloadRate, data.transferRate); // 👈 NEW
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

        // ✅ إلغاء مؤقت عدم التغيير
        _timeoutTimer?.cancel();
        _timeoutTimer = null;

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
        _timeoutTimer?.cancel();
        _timeoutTimer = null;
        emit(const InternetTestCancelled());
      },
    );
  }

  /// ✅ دالة فحص توقف السرعات
  void _checkStuckCondition(double download, double upload) {
    if (download == 0 && upload == 0) {
      if (_lastDownload == download && _lastUpload == upload) {
        if (_timeoutTimer == null) {
          _timeoutTimer = Timer(const Duration(seconds: 5), () {
            cancelTest();
          });
        }
      } else {
        _timeoutTimer?.cancel();
        _timeoutTimer = null;
        _lastDownload = download;
        _lastUpload = upload;
      }
    } else {
      _timeoutTimer?.cancel();
      _timeoutTimer = null;
      _lastDownload = download;
      _lastUpload = upload;
    }
  }

  /// ✅ يقيس ping
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

  /// ✅ إعادة تعيين الـ state إلى Initial
  void reset() {
    emit(const InternetSettingsInitial());
  }

  /// ✅ إلغاء الاختبار الحالي
  void cancelTest() {
    try {
      _internetSpeedTest.cancelTest();
    } catch (_) {}
    emit(const InternetTestCancelled());
  }
}
