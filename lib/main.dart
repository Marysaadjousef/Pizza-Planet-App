import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_planet/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'cubits/change_mode_cubit/change_mode_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeModeCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pizza Planet',
        home: SplashScreen(), // Wrap your SplashScreen widget here
      ),
    );
  }
}
