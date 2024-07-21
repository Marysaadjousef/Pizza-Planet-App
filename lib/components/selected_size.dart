import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_cubit.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_states.dart';
import '../constants/colors.dart';

class Selected extends StatelessWidget {
  String size;

  Selected({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeModeCubit, ModeState>(builder: (context, state) {
      Color textColor;
      if (state is DarkModeState) {
        textColor = black;
      } else {
        textColor = red;
      }
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            //shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          size,
          style: GoogleFonts.montserrat(
              color: textColor, fontSize: 24, fontWeight: FontWeight.w500),
        ),
      );
    });
  }
}
