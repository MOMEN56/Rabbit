import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rabbit/core/utils/app_assets.dart';
import 'package:rabbit/core/utils/app_dimensions.dart';

class StartBottom extends StatelessWidget {
  const StartBottom({super.key});
  @override
  Widget build(BuildContext context) {
    AppDimensions.init(context);
    return Padding(
      padding: EdgeInsets.only(top: AppDimensions.usableHeight * 0.08),
      child: Expanded(
        child: Container(child: Lottie.asset(AppAssets.startBottom)),
      ),
    );
  }
}
