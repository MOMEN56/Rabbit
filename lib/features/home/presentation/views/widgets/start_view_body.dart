import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabbit/core/utils/app_colors.dart';
import 'package:rabbit/core/utils/widgets/custom_app_bar.dart';
import 'package:rabbit/features/home/presentation/manger/cubit/cubit/start_view_cubit.dart';
import 'package:rabbit/features/home/presentation/manger/cubit/cubit/start_view_state.dart';
import 'package:rabbit/features/home/presentation/views/widgets/rocket_animation.dart';
import 'package:rabbit/features/home/presentation/views/widgets/start_bottom.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(),
      body: BlocBuilder<StartViewCubit, StartViewState>(
        builder: (context, state) {
          if (state is StartViewBottomState) {
            return const StartBottom();
          } else if ((state is StartViewRocketAnimationState)) {
            return const RocketAnimation();
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
