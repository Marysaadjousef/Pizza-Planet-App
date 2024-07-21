import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_cubit.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_states.dart';
import 'package:pizza_planet/screens/shared.dart';
import '../constants/colors.dart';
import '../models/pizzacard_model.dart';
import 'cart.dart';

class MenuHome extends StatefulWidget {
  Widget screen;
  static List<ProductCard> list = [];

  MenuHome({super.key, required this.screen});

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<ChangeModeCubit, ModeState>(builder: (context, state) {
      Color backgroundColor, iconColor;
      IconData modeIcon;
      String modeText;
      if (state is DarkModeState) {
        backgroundColor = darkGray;
        iconColor = red;
        modeIcon = Icons.light_mode_rounded;
        modeText = "Light Mode";
      } else {
        backgroundColor = red;
        iconColor = Colors.white;
        modeIcon = Icons.dark_mode_rounded;
        modeText = "Dark Mode";
      }
      return Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, left: 25),
              width: (0.55 * MediaQuery.of(context).size.width),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MENU",
                    style: GoogleFonts.orbitron(
                      color: iconColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  InkWell(
                    onTap: () {
                      isCollapsed = true;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Cart()));
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.shopping_cart,
                        color: iconColor,
                      ),
                      title: Text(
                        "Your Cart",
                        style: GoogleFonts.orbitron(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.location_on_rounded,
                      color: iconColor,
                    ),
                    title: Text(
                      "Delivery Address",
                      style: GoogleFonts.orbitron(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      BlocProvider.of<ChangeModeCubit>(context).changeMode();
                    },
                    child: ListTile(
                        leading: Icon(
                          modeIcon,
                          color: iconColor,
                        ),
                        title: Text(
                          modeText,
                          style: GoogleFonts.orbitron(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: iconColor,
                    ),
                    title: Text(
                      "Profile",
                      style: GoogleFonts.orbitron(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: iconColor,
                    ),
                    title: Text(
                      "Settings",
                      style: GoogleFonts.orbitron(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                ],
              ),
            ),
            !isCollapsed
                ? Transform.translate(
                    offset: Offset(0.45 * width, 0.04 * height),
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 10),
                      scale: 0.65,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: GestureDetector(
                          onHorizontalDragUpdate: (_) {
                            setState(() {
                              isCollapsed = !isCollapsed;
                            });
                          },
                          child: AbsorbPointer(child: widget.screen),
                        ),
                      ),
                    ),
                  )
                : widget.screen
          ],
        ),
      );
    });
  }
}
