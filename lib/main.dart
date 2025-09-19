import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rabbit/core/utils/routing/app_router.dart';

void main() {
  runApp(const Rabbit());
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
