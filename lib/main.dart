import 'package:Rabbit/features/home/presentation/manager/cubits/internet%20checker%20cubit/internet_checker_state_cubit.dart';
import 'package:Rabbit/rabbit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(
    BlocProvider(
      create: (_) => InternetCheckerStateCubit(),
      child: const Rabbit(),
    ),
  );
}

