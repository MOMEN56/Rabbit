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
    double uploadRate = 0,
    double uploadProgress = 0,
    bool showDownloadGraph = true,
    bool showUploadGraph = false,
  }) : super(
         isDownloading: true,
         showDownloadGraph: showDownloadGraph,
         isUploading: false,
         showUploadGraph: showUploadGraph,
         downloadRate: downloadRate,
         downloadProgress: downloadProgress,
         uploadRate: uploadRate,
         uploadProgress: uploadProgress,
       );
}

class InternetDownloadSuccess extends InternetSettingsState {
  const InternetDownloadSuccess({
    required double downloadRate,
    double uploadRate = 0,
    bool showDownloadGraph = true,
    bool showUploadGraph = false,
  }) : super(
         isDownloading: false,
         showDownloadGraph: showDownloadGraph,
         isUploading: false,
         showUploadGraph: showUploadGraph,
         downloadRate: downloadRate,
         uploadRate: uploadRate,
       );
}

class InternetUploadInProgress extends InternetSettingsState {
  const InternetUploadInProgress({
    required double uploadRate,
    required double uploadProgress,
    double downloadRate = 0,
    double downloadProgress = 0,
    bool showDownloadGraph = true,
    bool showUploadGraph = true,
  }) : super(
         isDownloading: false,
         showDownloadGraph: showDownloadGraph,
         isUploading: true,
         showUploadGraph: showUploadGraph,
         uploadRate: uploadRate,
         uploadProgress: uploadProgress,
         downloadRate: downloadRate,
         downloadProgress: downloadProgress,
       );
}

class InternetUploadSuccess extends InternetSettingsState {
  const InternetUploadSuccess({
    required double uploadRate,
    double downloadRate = 0,
    bool showDownloadGraph = true,
    bool showUploadGraph = true,
  }) : super(
         isDownloading: false,
         showDownloadGraph: showDownloadGraph,
         isUploading: false,
         showUploadGraph: showUploadGraph,
         uploadRate: uploadRate,
         downloadRate: downloadRate,
       );
}
