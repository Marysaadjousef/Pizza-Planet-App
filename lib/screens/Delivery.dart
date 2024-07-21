import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_cubit.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_states.dart';
import 'package:pizza_planet/screens/planet_pizza_home_screen.dart';

import '../components/bottom_navigator_bar.dart';
import '../constants/colors.dart';
import 'menu_home.dart';

class Delivery extends StatelessWidget {
  const Delivery({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeModeCubit, ModeState>(builder: (context, state) {
      Color backgroundColor;
      if (state is DarkModeState) {
        backgroundColor = black;
      } else {
        backgroundColor = Colors.white;
      }
      return Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/Take Away-amico.png"),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Your order is on its way! Sit tight, your delicious meal will arrive soon",
                    style: GoogleFonts.orbitron(
                        color: red, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return MenuHome(screen: const HomeScreen());
                  }));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  decoration: BoxDecoration(
                      color: red, borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Done",
                    style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
