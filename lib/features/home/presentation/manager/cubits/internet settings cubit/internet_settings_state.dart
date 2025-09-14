part of 'internet_settings_cubit.dart';

abstract class InternetSettingsState {
  final bool isDownloading;
  final bool showDownloadGraph;
  final bool isUploading;
  final bool showUploadGraph;

  final double downloadRate;
  final double uploadRate;
  final double downloadProgress;
  final double uploadProgress;

  const InternetSettingsState({
    this.isDownloading = false,
    this.showDownloadGraph = false,
    this.isUploading = false,
    this.showUploadGraph = false,
    this.downloadRate = 0,
    this.uploadRate = 0,
    this.downloadProgress = 0,
    this.uploadProgress = 0,
  });
}

class InternetSettingsInitial extends InternetSettingsState {
  const InternetSettingsInitial();
}

class InternetDownloadInProgress extends InternetSettingsState {
  const InternetDownloadInProgress({
    required double downloadRate,
    required double downloadProgress,
  }) : super(
         isDownloading: true,
         showDownloadGraph: true,
         downloadRate: downloadRate,
         downloadProgress: downloadProgress,
       );
}

class InternetUploadInProgress extends InternetSettingsState {
  const InternetUploadInProgress({
    required double uploadRate,
    required double uploadProgress,
    required double downloadRate,
  }) : super(
         isUploading: true,
         showUploadGraph: true,
         showDownloadGraph: true,
         uploadRate: uploadRate,
         uploadProgress: uploadProgress,
         downloadRate: downloadRate,
       );
}

class InternetTestCompleted extends InternetSettingsState {
  const InternetTestCompleted({
    required double downloadRate,
    required double uploadRate,
  }) : super(
         downloadRate: downloadRate,
         uploadRate: uploadRate,
         showDownloadGraph: true,
         showUploadGraph: true,
       );
}
