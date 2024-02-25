import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class NotSelectedSize extends StatelessWidget {
  String size;

  NotSelectedSize({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: darkMode? darkGray: red,
          //shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        size,
        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
