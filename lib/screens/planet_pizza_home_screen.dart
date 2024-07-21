import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_planet/components/home_list_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_cubit.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_states.dart';
import '../components/bottom_navigator_bar.dart';
import '../constants/colors.dart';
import '../models/pizzacard_model.dart';
import 'cart.dart';

class HomeScreen extends StatefulWidget {
  static List<ProductCard> pizzaList = [], dessertList = [];
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool pizzaOrDessert = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocBuilder<ChangeModeCubit, ModeState>(builder: (context, state) {
      Color backgroundColor,
          dividerColor,
          cardColor,
          selectedTextColor,
          unselectedTextColor;
      if (state is DarkModeState) {
        backgroundColor = black;
        dividerColor = darkGray;
        selectedTextColor = Colors.white;
        unselectedTextColor = Colors.white70;
        cardColor = darkGray;
      } else {
        backgroundColor = Colors.white;
        dividerColor = red;
        selectedTextColor = Colors.black;
        unselectedTextColor = Colors.black26;
        cardColor = black;
      }
      return Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
            color: backgroundColor, // black,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/pngwing.com.png",
                      height: 100,
                      width: 120,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Cart()));
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: red,
                          size: 30,
                        ))
                  ],
                ),
              ),
              Stack(
                  alignment: AlignmentDirectional.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                        clipBehavior: Clip.antiAlias,
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        width: width - 50,
                        height: height / 3.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: cardColor,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: dividerColor, width: 2))),
                                  child: Text(
                                    "MOST POPULAR",
                                    style: GoogleFonts.orbitron(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Spacer(
                                  flex: 3,
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      "GALAXY MENU",
                                      style: TextStyle(
                                          fontFamily: 'Righteous',
                                          color: Colors.white,
                                          fontSize: 24),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "1x Pizza XXL",
                                      style: GoogleFonts.orbitron(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "1x Soda 50cl",
                                      style: GoogleFonts.orbitron(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                const Spacer(
                                  flex: 4,
                                ),
                                const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "11.99",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Righteous'),
                                    ),
                                    Text(
                                      "\$",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Righteous'),
                                    ),
                                  ],
                                ),
                                const Spacer(
                                  flex: 2,
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: -16,
                              right: 60,
                              child: Transform.rotate(
                                angle: -0.25,
                                child: Image.asset(
                                  "assets/images/8103d927-e6b1-489b-8264-b8e7a4abdc45.png",
                                  width: 100,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -6,
                              right: -10,
                              child: Image.asset(
                                "assets/images/Pepperoni-Pizza-on-transparent-background-2PNG.png",
                                width: 146,
                              ),
                            ),
                          ],
                        )),
                    Positioned(
                      bottom: -20,
                      child: MaterialButton(
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 4),
                          decoration: BoxDecoration(
                              color: red,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "BUY",
                            style: GoogleFonts.orbitron(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          pizzaOrDessert = true;
                        });
                      },
                      child: Text(
                        "PIZZAS",
                        style: GoogleFonts.orbitron(
                            color: pizzaOrDessert
                                ? selectedTextColor
                                : unselectedTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "MENUS",
                      style: GoogleFonts.orbitron(
                          color: unselectedTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "DRINKS",
                      style: GoogleFonts.orbitron(
                          color: unselectedTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          pizzaOrDessert = false;
                        });
                      },
                      child: Text(
                        "DESSERTS",
                        style: GoogleFonts.orbitron(
                            color: !pizzaOrDessert
                                ? selectedTextColor
                                : unselectedTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              SizedBox(
                  height: height / 3,
                  child: HomeListView(
                    height: height,
                    width: width,
                    productsList: pizzaOrDessert
                        ? HomeScreen.pizzaList
                        : HomeScreen.dessertList,
                  )),
              const Spacer(
                flex: 1,
              ),
            ])),
        bottomNavigationBar: BottomNavigatorBar(
          screen: const HomeScreen(),
          darkBackColor: black,
          lightBackColor: Colors.white,
        ),
      );
    });
  }
}
