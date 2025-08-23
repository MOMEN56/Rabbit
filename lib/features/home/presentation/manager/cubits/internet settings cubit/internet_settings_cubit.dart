import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_test_plus/flutter_speed_test_plus.dart';

part 'internet_settings_state.dart';

class InternetSettingsCubit extends Cubit<InternetSettingsState> {
  InternetSettingsCubit() : super(const InternetSettingsInitial());

  final FlutterInternetSpeedTest _internetSpeedTest =
      FlutterInternetSpeedTest()..enableLog();

  Future<void> startDownloadTest() async {
    await _internetSpeedTest.startTesting(
      onStarted: () {
        emit(
          const InternetDownloadInProgress(
            downloadRate: 0,
            downloadProgress: 0,
          ),
        );
      },
      onProgress: (percent, data) {
        if (data.type == TestType.download) {
          emit(
            InternetDownloadInProgress(
              downloadRate: data.transferRate,
              downloadProgress: percent,
            ),
          );
        }
      },
      onCompleted: (download, upload) async {
        emit(InternetDownloadSuccess(downloadRate: download.transferRate));
        // Delay صغير قبل بدء Upload
        await Future.delayed(const Duration(milliseconds: 200));
        startUploadTest();
      },
    );
  }

  Future<void> startUploadTest() async {
    await _internetSpeedTest.startTesting(
      onStarted: () {
        emit(
          InternetUploadInProgress(
            uploadRate: 0,
            uploadProgress: 0,
            downloadRate: state.downloadRate,
            downloadProgress: state.downloadProgress,
            showDownloadGraph: state.showDownloadGraph, // تمرير القيمة
            showUploadGraph: true,
          ),
        );
      },
      onProgress: (percent, data) {
        if (data.type == TestType.upload) {
          emit(
            InternetUploadInProgress(
              uploadRate: data.transferRate,
              uploadProgress: percent,
              downloadRate: state.downloadRate,
              downloadProgress: state.downloadProgress,
              showDownloadGraph: state.showDownloadGraph,
              showUploadGraph: true,
            ),
          );
        }
      },
      onCompleted: (download, upload) {
        emit(
          InternetUploadSuccess(
            uploadRate: upload.transferRate,
            downloadRate: state.downloadRate,
            showDownloadGraph: state.showDownloadGraph,
            showUploadGraph: true,
          ),
        );
      },
    );
  }
}
