import 'package:flutter/material.dart';
import 'package:rabbit/core/utils/app_colors.dart';
import 'package:rabbit/core/utils/widgets/custom_app_bar.dart';
import 'package:rabbit/features/home/presentation/views/widgets/rocket_animation.dart';
import 'package:rabbit/features/home/presentation/views/widgets/start_bottom.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.backgroundColor,
      body: StartBottom(),
    );
  }
}
