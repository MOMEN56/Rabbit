import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Rabbit/features/home/presentation/widgets/home_view_body.dart';
import 'package:Rabbit/features/start/presentation/manager/cubits/start_view_cubit/start_view_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StartViewCubit(),
      child: const HomeViewBody(),
    );
  }
}
