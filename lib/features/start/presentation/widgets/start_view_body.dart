import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabbit/core/utils/app_colors.dart';
import 'package:rabbit/core/utils/app_dimensions.dart';
import 'package:rabbit/core/utils/widgets/custom_app_bar.dart';
import 'package:rabbit/features/start/presentation/manager/cubits/start_view_cubit/start_view_cubit.dart';
import 'package:rabbit/features/start/presentation/manager/cubits/start_view_cubit/start_view_state.dart';
import 'package:rabbit/features/start/presentation/widgets/rocket_animation.dart';
import 'package:rabbit/features/start/presentation/widgets/start_button.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    AppDimensions.init(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(),

      body: BlocListener<StartViewCubit, StartViewState>(
        listener: (context, state) {
          if (state is StartViewNavigateToHomeState) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
        child: BlocBuilder<StartViewCubit, StartViewState>(
          builder: (context, state) {
            if (state is StartViewButtonState) {
              return Column(
                children: [
                  const StartButton(),
                  SizedBox(height: AppDimensions.usableHeight * 0.25),
                ],
              );
            } else if (state is StartViewRocketAnimationState) {
              return const RocketAnimation();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
