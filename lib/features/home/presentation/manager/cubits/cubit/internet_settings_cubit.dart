import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_test_plus/flutter_speed_test_plus.dart';

part 'internet_settings_state.dart';

class InternetSettingsCubit extends Cubit<InternetSettingsState> {
  InternetSettingsCubit() : super(InternetSettingsInitial());

  final FlutterInternetSpeedTest _internetSpeedTest =
      FlutterInternetSpeedTest()..enableLog();

  Future<void> startDownloadTest() async {
    await _internetSpeedTest.startTesting(
      onStarted: () {
        emit(InternetDownloadTestProgress(downloadRate: 0, progress: 0));
      },
      onProgress: (percent, data) {
        if (data.type == TestType.download) {
          emit(
            InternetDownloadTestProgress(
              downloadRate: data.transferRate,
              progress: percent,
            ),
          );
        }
      },
      onCompleted: (download, upload) {
        emit(InternetDownloadTestSuccess(download.transferRate));
      },
    );
  }
}
