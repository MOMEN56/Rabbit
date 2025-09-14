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
          SizedBox(height: AppDimensions.usableHeight * 0.03),

          BlocBuilder<InternetSettingsCubit, InternetSettingsState>(
            builder: (context, state) {
              final speed =
                  state.isUploading ? state.uploadRate : state.downloadRate;

              return Container(
                height: AppDimensions.usableHeight * 0.4,
                width: AppDimensions.screenWidth * 0.9,
                child: SpeedMeter(speed: speed),
              );
            },
          ),
          SizedBox(height: AppDimensions.usableHeight * 0.08),

          BlocBuilder<InternetSettingsCubit, InternetSettingsState>(
            builder: (context, state) {
              double downloadRate = state.downloadRate;
              double uploadRate = state.uploadRate;

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomContainer(
                    unit: 'Download',
                    data: '${downloadRate.toStringAsFixed(2)} Mbps',
                    icon: Icons.download,
                    isClicked: state.isDownloading,
                    showGraph: state.showDownloadGraph,
                  ),
                  CustomContainer(
                    unit: 'Upload',
                    data: '${uploadRate.toStringAsFixed(2)} Mbps',
                    icon: Icons.upload,
                    isClicked: state.isUploading,
                    showGraph: state.showUploadGraph,
                  ),
                ],
              );
            },
          ),

          // ✅ Ping & Jitter ثابتة
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomContainer(unit: 'Ping', data: '15 ms'),
              CustomContainer(unit: 'Jitter', data: '12 ms'),
            ],
          ),
          SizedBox(height: AppDimensions.usableHeight * 0.03),
        ],
      ),
    );
  }
}
