import 'package:flutter/material.dart';
import 'package:rabbit/core/utils/app_colors.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Text(
          'Welcome to Rabbit Home',
          style: TextStyle(color: AppColors.backgroundColor, fontSize: 24),
        ),
      ),
    );
  }
}
