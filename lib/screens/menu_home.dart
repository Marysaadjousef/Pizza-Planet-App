import 'package:course/screens/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../models/card.dart';
import 'cart.dart';
import 'menu.dart';

class MenuHome extends StatefulWidget {
  Widget screen;
  static List<PizzaCard> list = [];

  MenuHome({super.key, required this.screen});

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: darkMode? darkGray: red,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50,left: 25),
            width:(0.55* MediaQuery.of(context).size.width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("MENU",style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const Spacer(flex: 1,),
                InkWell(
                  onTap: (){
                    isCollapsed = true;
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> const Cart()));
                  },
                  child: ListTile(
                    leading: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    title: Text("Your Cart",
                      style: GoogleFonts.orbitron(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.location_on_rounded,
                    color: Colors.white,
                  ),
                  title: Text("Delivery Address",
                    style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      darkMode = !darkMode;
                    });
                  },
                  child: ListTile(
                    leading: const Icon(
                      Icons.dark_mode_rounded,
                      color: Colors.white,
                    ),
                    title: Text("Dark Mode",
                      style: GoogleFonts.orbitron(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: Text("Profile",
                    style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: Text("Settings",
                    style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                const Spacer(flex: 4,),

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
  }
}
