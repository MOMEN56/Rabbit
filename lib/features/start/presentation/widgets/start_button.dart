import 'package:Rabbit/core/utils/widgets/custom_snack_bar.dart';
import 'package:Rabbit/features/home/presentation/manager/cubits/internet%20checker%20cubit/internet_checker_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:Rabbit/core/utils/app_assets.dart';
import 'package:Rabbit/features/start/presentation/manager/cubits/start_view_cubit/start_view_cubit.dart';
import 'package:Rabbit/features/start/presentation/manager/cubits/start_view_cubit/start_view_state.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

class StartButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const StartButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetCheckerStateCubit, InternetCheckerStateState>(
      listener: (context, state) async {
        CustomSnackBar.showConnected(context);
      },
      builder: (context, internetState) {
        return BlocBuilder<StartViewCubit, StartViewState>(
          builder: (context, state) {
            if (state is StartViewButtonState) {
              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    final connectionState =
                        context.read<InternetCheckerStateCubit>().state;

                    switch (connectionState.runtimeType) {
                      case InternetConnected:
                        if (await Vibration.hasCustomVibrationsSupport()) {
                          Vibration.vibrate(
                            preset: VibrationPreset.singleShortBuzz,
                          );
                        }
                        BlocProvider.of<StartViewCubit>(
                          context,
                        ).showRocketAnimation();
                        break;

                      case InternetNoAccess:
                        CustomSnackBar.showNoAccess(context);
                        if (await Vibration.hasCustomVibrationsSupport()) {
                          Vibration.vibrate(
                            preset: VibrationPreset.gentleReminder,
                          );
                          CustomSnackBar.showNoAccess(context);
                        }
                        break;

                      case InternetDisconnected:
                        CustomSnackBar.showDisconnected(context);
                        if (await Vibration.hasCustomVibrationsSupport()) {
                          Vibration.vibrate(
                            preset: VibrationPreset.gentleReminder,
                          );
                          CustomSnackBar.showDisconnected(context);
                        }
                        break;
                    }

                    onPressed?.call();
                  },
                  child: Center(child: Lottie.asset(AppAssets.startButton)),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        );
      },
    );
  }
}
