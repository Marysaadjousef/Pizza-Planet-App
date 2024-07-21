import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../cubits/change_mode_cubit/change_mode_cubit.dart';
import '../cubits/change_mode_cubit/change_mode_states.dart';
import '../models/pizzacard_model.dart';
import '../screens/menu_home.dart';
import '../screens/planet_pizza_first_screen.dart';

class HomeListItem extends StatelessWidget {
  HomeListItem(
      {super.key,
      required this.height,
      required this.width,
      required this.context,
      required this.turns,
      required this.productsList,
      required this.category,
      required this.index});
  List<ProductCard> productsList;
  final double width, height;
  final BuildContext context;
  double turns = 0;
  final String category;
  int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MenuHome(
                  screen: PlanetPizza(
                      pizzaCard: ProductCard(
                          category: productsList[(index % productsList.length)]
                              .category,
                          id: (index) + 1,
                          image:
                              productsList[(index % productsList.length)].image,
                          name:
                              productsList[(index % productsList.length)].name,
                          description:
                              productsList[(index % productsList.length)]
                                  .description)))));
    }, child:
        BlocBuilder<ChangeModeCubit, ModeState>(builder: (context, state) {
      Color itemColor;
      if (state is DarkModeState) {
        itemColor = darkGray;
      } else {
        itemColor = red;
      }
      return Container(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(left: 25),
        height: height / 3,
        width: width / 2.5,
        decoration: BoxDecoration(
            color: itemColor, borderRadius: BorderRadius.circular(15)),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8),
                  child: Text(
                    "0${index + 1}",
                    style:
                        GoogleFonts.orbitron(color: Colors.white, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    productsList[(index % productsList.length)].name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'Righteous'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    productsList[(index % productsList.length)].description,
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
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${productsList[(index % productsList.length)].smallSizePrice}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Righteous'),
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
                SizedBox(
                  height: height / 9,
                )
              ],
            ),
            Positioned(
              top: height / 3 - height / 9,
              child: AnimatedRotation(
                duration: const Duration(seconds: 1),
                turns: turns,
                child: Image.asset(
                  "assets/images/${productsList[(index % productsList.length)].image}",
                  width: 200,
                ),
              ),
            ),
          ],
        ),
      );
    }));
  }
}
