part of 'internet_settings_cubit.dart';

abstract class InternetSettingsState {
  final bool isDownloading;
  final bool showGraph;
  const InternetSettingsState({
    this.isDownloading = false,
    this.showGraph = false,
  });
}

class InternetSettingsInitial extends InternetSettingsState {
  const InternetSettingsInitial() : super(isDownloading: false);
}

class InternetDownloadTestProgress extends InternetSettingsState {
  final double downloadRate;
  final double progress;

  const InternetDownloadTestProgress({
    required this.downloadRate,
    required this.progress,
    required bool isDownloading,
    required bool showGraph,
  }) : super(isDownloading: isDownloading, showGraph: showGraph);
}

class InternetDownloadTestSuccess extends InternetSettingsState {
  final double downloadRate;

  const InternetDownloadTestSuccess(
    this.downloadRate, {
    required bool isDownloading,
    required bool showGraph,
  }) : super(isDownloading: isDownloading, showGraph: showGraph);
}
