import 'package:flutter/material.dart';
import 'package:rabbit/features/home/presentation/views/home_view.dart';

void main() {
  runApp(const Rabbit());
}

class Rabbit extends StatelessWidget {
  const Rabbit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
