part of 'internet_settings_cubit.dart';

abstract class InternetSettingsState {}

class InternetSettingsInitial extends InternetSettingsState {}

class InternetDownloadTestProgress extends InternetSettingsState {
  final double downloadRate;
  final double progress;

  InternetDownloadTestProgress({
    required this.downloadRate,
    required this.progress,
  });
}

class InternetDownloadTestSuccess extends InternetSettingsState {
  final double downloadRate;
  InternetDownloadTestSuccess(this.downloadRate);
}
