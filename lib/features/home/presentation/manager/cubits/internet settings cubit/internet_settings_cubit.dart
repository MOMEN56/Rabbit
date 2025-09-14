import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_test_plus/flutter_speed_test_plus.dart';

part 'internet_settings_state.dart';

class InternetSettingsCubit extends Cubit<InternetSettingsState> {
  InternetSettingsCubit() : super(const InternetSettingsInitial());

  final FlutterInternetSpeedTest _internetSpeedTest =
      FlutterInternetSpeedTest()..enableLog();

  Future<void> startTest() async {
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
          ),
        );
      },
      onError: (errorMessage, error) {
        emit(const InternetSettingsInitial());
      },
      onCancel: () {
        emit(const InternetSettingsInitial());
      },
    );
  }
}
