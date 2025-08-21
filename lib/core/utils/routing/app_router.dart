import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabbit/features/home/presentation/manager/cubits/cubit/internet_settings_cubit.dart';
import 'package:rabbit/features/home/presentation/views/home_view.dart';
import 'package:rabbit/features/start/presentation/views/start_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const StartView());
      case '/home':
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (_) => InternetSettingsCubit()..startDownloadTest(),
                child: const HomeView(),
              ),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
