import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Rabbit/core/utils/app_colors.dart';
import 'package:Rabbit/core/utils/app_dimensions.dart';
import 'package:Rabbit/core/utils/format_helper.dart';
import 'package:Rabbit/core/utils/widgets/custom_app_bar.dart';
import 'package:Rabbit/features/home/presentation/manager/cubits/internet%20settings%20cubit/internet_settings_cubit.dart';
import 'package:Rabbit/features/home/presentation/widgets/custom_container.dart';
import 'package:Rabbit/features/home/presentation/widgets/speed_meter.dart';
import 'package:Rabbit/features/home/presentation/widgets/start_elevated_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    AppDimensions.init(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: BlocBuilder<InternetSettingsCubit, InternetSettingsState>(
          builder: (context, state) {
            return CustomAppBar(cancelIcon: true);
          },
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          SizedBox(height: AppDimensions.usableHeight * 0.025),

          BlocBuilder<InternetSettingsCubit, InternetSettingsState>(
            builder: (context, state) {
              final speed =
                  state.isUploading ? state.uploadRate : state.downloadRate;
              final bool testCompleted = state is InternetTestCompleted;

              return SizedBox(
                height: AppDimensions.usableHeight * 0.35,
                child:
                    (testCompleted && !state.bool6Sec) ||
                            state is InternetTestCancelled
                        ? StartElevatedButton()
                        : SpeedMeter(speed: speed),
              );
            },
          ),
          SizedBox(height: AppDimensions.usableHeight * 0.08),

          BlocBuilder<InternetSettingsCubit, InternetSettingsState>(
            builder: (context, state) {
              final cubit = context.read<InternetSettingsCubit>();
              double downloadRate = state.downloadRate;
              double uploadRate = state.uploadRate;
              String ip = cubit.ip ?? '0.0.0.0';
              int pingValue = state.ping;

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomContainer(
                        unit: 'Download',
                        data: FormatHelper.formatSpeed(downloadRate),
                        icon: Icons.download,
                        isClicked: state.isDownloading,
                        showGraph: state.showDownloadGraph,
                      ),
                      CustomContainer(
                        unit: 'Upload',
                        data: FormatHelper.formatSpeed(uploadRate),
                        icon: Icons.upload,
                        isClicked: state.isUploading,
                        showGraph: state.showUploadGraph,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomContainer(
                        unit: 'Ping',
                        data: '${pingValue.toString()} ms',
                        isClicked: state.bool6Sec,
                      ),
                      CustomContainer(
                        unit: 'IP',
                        data: pingValue != 0 ? ip : '0.0.0.0',
                        isClicked: state.bool6Sec,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),

          SizedBox(height: AppDimensions.usableHeight * 0.025),
        ],
      ),
    );
  }
}
