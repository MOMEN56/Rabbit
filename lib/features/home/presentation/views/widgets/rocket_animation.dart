import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:rabbit/core/utils/app_assets.dart';
import 'package:rabbit/features/home/presentation/manger/cubit/cubit/start_view_cubit.dart';
import 'package:rabbit/features/home/presentation/manger/cubit/cubit/start_view_state.dart';

class RocketAnimation extends StatelessWidget {
  const RocketAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartViewCubit, StartViewState>(
      builder: (context, state) {
        if (state is StartViewRocketAnimationState) {
          return Column(
            children: [
              Expanded(child: Container(child: Lottie.asset(AppAssets.rocket))),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
