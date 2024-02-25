import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../screens/cart.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: darkMode? darkGray: red),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/${Cart.items[index].image}",
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "0${Cart.items[index].id}",
                      style: GoogleFonts.orbitron(
                          color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      Cart.items[index].name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: "Righteous"),
                    ),

                    Text(
                      "\$8.99",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Righteous"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
