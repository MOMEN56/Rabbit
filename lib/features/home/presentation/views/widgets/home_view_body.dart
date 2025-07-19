import 'package:flutter/material.dart';
import 'package:rabbit/core/utils/app_colors.dart';
import 'package:rabbit/core/utils/app_dimensions.dart';
import 'package:rabbit/core/utils/widgets/custom_app_bar.dart';
import 'package:rabbit/features/home/presentation/views/widgets/custom_container.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    AppDimensions.init(context);

    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          SizedBox(height: AppDimensions.usableHeight * 0.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomContainer(
                unit: 'Download',
                data: '50 mbps',
                icon: Icons.download,
              ),
              const CustomContainer(
                unit: 'Upload',
                data: '50 mbps',
                icon: Icons.upload,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomContainer(unit: 'Ping', data: '15 ms'),
              const CustomContainer(unit: 'Jitter', data: '12 ms'),
            ],
          ),
        ],
      ),
    );
  }
}
