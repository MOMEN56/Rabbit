import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabbit/features/home/presentation/manger/cubit/cubit/start_view_cubit.dart';
import 'package:rabbit/features/home/presentation/views/widgets/start_view_body.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StartViewCubit(),
      child: const StartViewBody(),
    );
  }
}
