import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_cubit.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_states.dart';

import '../constants/colors.dart';

class NotSelectedSize extends StatelessWidget {
  String size;

  NotSelectedSize({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeModeCubit, ModeState>(builder: (context, state) {
      Color containerColor;
      if (state is DarkModeState) {
        containerColor = darkGray;
      } else {
        containerColor = red;
      }
      return Container(
        decoration: BoxDecoration(
            color: containerColor,
            //shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          size,
          style: GoogleFonts.montserrat(color: Colors.white, fontSize: 24),
        ),
      );
    });
  }
}
