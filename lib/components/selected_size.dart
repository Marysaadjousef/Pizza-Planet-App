import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class Selected extends StatelessWidget {
  String size;

  Selected({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          //shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        size,
        style: GoogleFonts.montserrat(color: darkMode? Colors.black: red, fontSize: 24,fontWeight: FontWeight.w500),
      ),
    );
  }
}
