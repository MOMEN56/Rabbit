import 'package:Rabbit/features/home/presentation/manager/cubits/internet%20checker%20cubit/internet_checker_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Rabbit/core/utils/routing/app_router.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => InternetCheckerStateCubit(),
      child: const Rabbit(),
    ),
  );
}

class Rabbit extends StatelessWidget {
  const Rabbit({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(552, 988),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: '/',
        );
      },
    );
  }
}
