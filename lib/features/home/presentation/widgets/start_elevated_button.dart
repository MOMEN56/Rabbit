import 'package:Rabbit/features/home/presentation/manager/cubits/internet%20settings%20cubit/internet_settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';
import 'package:Rabbit/core/utils/app_assets.dart';
import 'package:Rabbit/core/utils/widgets/custom_snack_bar.dart';
import 'package:Rabbit/features/home/presentation/manager/cubits/internet%20checker%20cubit/internet_checker_state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
import 'package:Rabbit/features/start/presentation/manager/cubits/start_view_cubit/start_view_cubit.dart';
=======
>>>>>>> ead6508 (add button to appbar)

class StartElevatedButton extends StatelessWidget {
  const StartElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetCheckerStateCubit, InternetCheckerStateState>(
      listener: (context, state) async {
<<<<<<< HEAD
        // ✅ لو الإنترنت رجع بعد انقطاع
=======
>>>>>>> ead6508 (add button to appbar)
        if (state is InternetConnected) {
          CustomSnackBar.showConnected(context);
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () async {
            final connectionState =
                context.read<InternetCheckerStateCubit>().state;

            switch (connectionState.runtimeType) {
              case InternetConnected:
                context.read<InternetSettingsCubit>().reset();
<<<<<<< HEAD
=======
                context.read<InternetSettingsCubit>().startTest();
>>>>>>> ead6508 (add button to appbar)
                if (await Vibration.hasCustomVibrationsSupport()) {
                  Vibration.vibrate(preset: VibrationPreset.singleShortBuzz);
                }
                break;

              case InternetNoAccess:
                CustomSnackBar.showNoAccess(context);
                context.read<InternetSettingsCubit>().cancelTest();

                if (await Vibration.hasCustomVibrationsSupport()) {
                  Vibration.vibrate(preset: VibrationPreset.gentleReminder);
                }
                break;

              case InternetDisconnected:
                CustomSnackBar.showDisconnected(context);
                context.read<InternetSettingsCubit>().cancelTest();
                if (await Vibration.hasCustomVibrationsSupport()) {
                  Vibration.vibrate(preset: VibrationPreset.gentleReminder);
                }
                break;
            }
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            elevation: WidgetStateProperty.all(0),
            shadowColor: WidgetStateProperty.all(Colors.transparent),
            surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            splashFactory: NoSplash.splashFactory, // 🔥 إلغاء تأثير الضغط
            padding: WidgetStateProperty.all(EdgeInsets.zero),
          ),
          child: Lottie.asset(AppAssets.startButton, fit: BoxFit.cover),
        );
      },
    );
  }
}
