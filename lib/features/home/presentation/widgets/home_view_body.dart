import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabbit/core/utils/app_colors.dart';
import 'package:rabbit/core/utils/app_dimensions.dart';
import 'package:rabbit/core/utils/widgets/custom_app_bar.dart';
import 'package:rabbit/features/home/presentation/manager/cubits/cubit/internet_settings_cubit.dart';
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
              if (state is InternetDownloadTestProgress ||
                  state is InternetDownloadTestSuccess) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomContainer(
                      unit: 'Download',
                      data:
                          '${state is InternetDownloadTestProgress ? state.downloadRate.toStringAsFixed(2) : (state as InternetDownloadTestSuccess).downloadRate.toStringAsFixed(2)} Mbps',
                      icon: Icons.download,
                      isClicked: state.isDownloading,
                      showGraph: state.showGraph,
                    ),
                    const CustomContainer(
                      unit: 'Upload',
                      data: '50 mbps',
                      icon: Icons.upload,
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
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
