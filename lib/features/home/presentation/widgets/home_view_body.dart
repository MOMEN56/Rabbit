import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabbit/core/utils/app_colors.dart';
import 'package:rabbit/core/utils/app_dimensions.dart';
import 'package:rabbit/core/utils/widgets/custom_app_bar.dart';
import 'package:rabbit/features/home/presentation/manager/cubits/internet%20settings%20cubit/internet_settings_cubit.dart';
import 'package:rabbit/features/home/presentation/widgets/custom_container.dart';
import 'package:rabbit/features/home/presentation/widgets/speed_meter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    AppDimensions.init(context);

    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          SpeedMeter(),
          BlocBuilder<InternetSettingsCubit, InternetSettingsState>(
            builder: (context, state) {
              // قيم افتراضية
              double downloadRate = 0;
              bool isDownloading = false;
              bool showDownloadGraph = false;

              double uploadRate = 0;
              bool isUploading = false;
              bool showUploadGraph = false;

              // ضبط القيم بناءً على نوع الـ state
              if (state is InternetDownloadInProgress ||
                  state is InternetDownloadSuccess) {
                downloadRate = state.downloadRate;
                isDownloading = state.isDownloading;
                showDownloadGraph = state.showDownloadGraph;
              }

              if (state is InternetUploadInProgress ||
                  state is InternetUploadSuccess) {
                downloadRate = state.downloadRate;
                uploadRate = state.uploadRate;
                isUploading = state.isUploading;
                showUploadGraph = state.showUploadGraph;
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomContainer(
                    unit: 'Download',
                    data: '${downloadRate.toStringAsFixed(2)} Mbps',
                    icon: Icons.download,
                    isClicked: isDownloading,
                    showGraph: true,
                  ),
                  CustomContainer(
                    unit: 'Upload',
                    data: '${uploadRate.toStringAsFixed(2)} Mbps',
                    icon: Icons.upload,
                    isClicked: isUploading,
                    showGraph: showUploadGraph,
                  ),
                ],
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomContainer(unit: 'Ping', data: '15 ms'),
              const CustomContainer(unit: 'Jitter', data: '12 ms'),
            ],
          ),
          SizedBox(height: AppDimensions.usableHeight * 0.02),
        ],
      ),
    );
  }
}
