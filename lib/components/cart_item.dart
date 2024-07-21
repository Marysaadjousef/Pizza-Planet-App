import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../cubits/change_mode_cubit/change_mode_cubit.dart';
import '../cubits/change_mode_cubit/change_mode_states.dart';
import '../models/pizzacard_model.dart';
import '../screens/cart.dart';
import '../screens/menu_home.dart';
import '../screens/planet_pizza_first_screen.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MenuHome(
                    screen: PlanetPizza(
                        pizzaCard: ProductCard(
                            category: Cart.items[index].category,
                            id: Cart.items[index].id,
                            image: Cart.items[index].image,
                            name: Cart.items[index].name,
                            description: Cart.items[index].description)))));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child:
            BlocBuilder<ChangeModeCubit, ModeState>(builder: (context, state) {
          Color itemColor;
          if (state is DarkModeState) {
            itemColor = darkGray;
          } else {
            itemColor = red;
          }
          return Container(
            // margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: itemColor),
            child: Stack(children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/${Cart.items[index].image}",
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
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
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.preahvihear(
                          color: Colors.white, fontSize: 18),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          Cart.items[index].quantity.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.preahvihear(
                              color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          " ${Cart.items[index].size.toString()}",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.preahvihear(
                              color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
              Positioned(
                right: 2,
                bottom: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (Cart.items[index].price * Cart.items[index].quantity)
                          .toStringAsFixed(2),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24),
                    ),
                    const Text(
                      "\$",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Righteous'),
                    ),
                  ],
                ),
              ),
            ]),
          );
        }),
      ),
    );
  }
}
