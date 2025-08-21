import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rabbit/core/utils/app_assets.dart';

class SpeedMeter extends StatelessWidget {
  const SpeedMeter({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Lottie.asset(AppAssets.speedMeter, repeat: false));
  }
}
