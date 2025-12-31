import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:Rabbit/core/utils/app_assets.dart';
import 'package:Rabbit/features/start/presentation/manager/cubits/start_view_cubit/start_view_cubit.dart';
import 'package:Rabbit/features/start/presentation/manager/cubits/start_view_cubit/start_view_state.dart';

class RocketAnimation extends StatelessWidget {
  const RocketAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartViewCubit, StartViewState>(
      builder: (context, state) {
        if (state is StartViewRocketAnimationState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(child: Center(child: Lottie.asset(AppAssets.rocket))),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
