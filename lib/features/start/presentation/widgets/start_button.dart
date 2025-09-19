import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:rabbit/core/utils/app_assets.dart';
import 'package:rabbit/core/utils/app_dimensions.dart';
import 'package:rabbit/features/start/presentation/manager/cubits/start_view_cubit/start_view_cubit.dart';
import 'package:rabbit/features/start/presentation/manager/cubits/start_view_cubit/start_view_state.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

class StartButton extends StatelessWidget {
  final VoidCallback? onPressed; // 👈 بقت optional

  const StartButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    AppDimensions.init(context);
    return BlocBuilder<StartViewCubit, StartViewState>(
      builder: (context, state) {
        if (state is StartViewButtonState) {
          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque, // 👈 يضمن التقاط الضغط
              onTap: () async {
                if (await Vibration.hasCustomVibrationsSupport()) {
                  Vibration.vibrate(preset: VibrationPreset.singleShortBuzz);
                }
                BlocProvider.of<StartViewCubit>(context).showRocketAnimation();

                onPressed?.call(); // 👈 هنا استدعاء الكولباك لو موجود
              },
              child: Center(child: Lottie.asset(AppAssets.startButton)),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
