import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../models/card.dart';
import '../screens/menu_home.dart';
import '../screens/planet_pizza_first_screen.dart';
import '../screens/planet_pizza_home_screen.dart';

class PizzaListItem extends StatelessWidget {
  PizzaListItem({super.key, required this.index, required this.height, required this.width, required this.context, required this.turns});
  final int index;
  final double width, height;
  final BuildContext context;
  double turns = 0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MenuHome(screen:PlanetPizza(
                  pizzaCard: PizzaCard(
                    id: index + 1,
                    image: PizzaHomeScreen.list[index].image,
                    name: PizzaHomeScreen.list[index].name,
                    description: PizzaHomeScreen.list[index].description)))));
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(left: 25),
        height: height / 3,
        width: width / 2.5,
        decoration: BoxDecoration(
            color: darkMode? darkGray: red,
            borderRadius: BorderRadius.circular(15)),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  const EdgeInsets.only(left: 8.0, top: 8),
                  child: Text(
                    "0${index + 1}",
                    style: GoogleFonts.orbitron(
                        color: Colors.white, fontSize: 20),
                  ),
                ),
                Padding(
                  padding:  const EdgeInsets.only(left: 8.0),
                  child: Text(
                    PizzaHomeScreen.list[index].name,
                    overflow: TextOverflow.ellipsis,
                    style:  const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'Righteous'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    PizzaHomeScreen.list[index].description,
                    style: GoogleFonts.syncopate(
                        color: Colors.white, fontSize: 12),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'from',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "8.99",
                    style:  const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: "Righteous"),
                  ),
                ),
                SizedBox(
                  height: height/9,
                )
              ],
            ),
            Positioned(
              top: height/3 - height/9,
              child: AnimatedRotation(
                duration: const Duration(seconds: 1),
                turns: turns,
                child: Image.asset(
                  "assets/images/${PizzaHomeScreen.list[index].image}",
                  width: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
