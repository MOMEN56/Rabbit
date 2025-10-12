import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';
import 'package:rabbit/core/utils/app_assets.dart';

class StartElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;

  const StartElevatedButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // ✅ الاهتزاز عند الضغط
        if (await Vibration.hasCustomVibrationsSupport()) {
          Vibration.vibrate(preset: VibrationPreset.singleShortBuzz);
        }

        // ✅ تنفيذ الوظيفة المرسلة
        onPressed();
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        elevation: WidgetStateProperty.all(0),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        splashFactory: NoSplash.splashFactory, // 🔥 إلغاء تأثير الضغط تمامًا
        padding: WidgetStateProperty.all(EdgeInsets.zero),
      ),
      child: Lottie.asset(AppAssets.startButton, fit: BoxFit.cover),
    );
  }
}
