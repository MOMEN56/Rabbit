import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:rabbit/core/utils/app_assets.dart';
import 'package:rabbit/core/utils/app_dimensions.dart';
import 'package:rabbit/features/home/presentation/manger/cubit/cubit/start_view_cubit.dart';
import 'package:rabbit/features/home/presentation/manger/cubit/cubit/start_view_state.dart';

class StartBottom extends StatelessWidget {
  const StartBottom({super.key});

  @override
  Widget build(BuildContext context) {
    AppDimensions.init(context);

    return BlocBuilder<StartViewCubit, StartViewState>(
      builder: (context, state) {
        if (state is StartViewBottomState) {
          return Padding(
            padding: EdgeInsets.only(top: AppDimensions.usableHeight * 0.08),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<StartViewCubit>(context).showRocketAnimation();
              },
              child: SizedBox.expand(
                child: Lottie.asset(AppAssets.startBottom),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
