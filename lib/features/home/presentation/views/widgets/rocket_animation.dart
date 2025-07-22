import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rabbit/core/utils/app_assets.dart';

class RocketAnimation extends StatelessWidget {
  const RocketAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(child: Lottie.asset(AppAssets.rocket)));
  }
}
