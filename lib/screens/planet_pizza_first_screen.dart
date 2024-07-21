import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_planet/components/bottom_navigator_bar.dart';
import 'package:pizza_planet/components/not_selected_size.dart';
import 'package:pizza_planet/constants/colors.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_cubit.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_states.dart';
import 'package:pizza_planet/models/pizzacard_model.dart';
import 'package:pizza_planet/screens/planet_pizza_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_planet/screens/shared.dart';
import 'cart.dart';
import '../components/selected_size.dart';
import '../network/local/pizza_database.dart';
import 'menu_home.dart';

class PlanetPizza extends StatefulWidget {
  final ProductCard pizzaCard;
  const PlanetPizza({super.key, required this.pizzaCard});

  @override
  State<PlanetPizza> createState() => _PlanetPizzaState();
}

class _PlanetPizzaState extends State<PlanetPizza> {
  double turns = 0;
  List<Map<String, dynamic>> productsSizesInfo = [];
  int quantity = 1;
  bool l = true, xl = false, xxl = false;
  int productSizeId = 1;
  double price = 0;
  bool showDialogMessage = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSizesPrices();
  }

  Future<void> getSizesPrices() async {
    productsSizesInfo = await ItemsDatabase.getDataWhere(
        "ItemSizes", "item_id", ["${widget.pizzaCard.id}"]);
    setState(() {
      price = double.parse(productsSizesInfo[0]['price'].toString());
      productSizeId = productsSizesInfo[0]['id'];
      turns = 1;
    });

    setState(() {
      price = double.parse(productsSizesInfo[0]['price'].toString());
      productSizeId = productsSizesInfo[0]['id'];
      turns = 1;
    });
  }

  Future<Widget> showMessage() async {
    await showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Added Successfully",
                style: GoogleFonts.syncopate(
                    color: Colors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            actions: [
              CupertinoDialogAction(
                child: BlocBuilder<ChangeModeCubit, ModeState>(
                    builder: (context, state) {
                  Color textColor;
                  if (state is DarkModeState) {
                    textColor = darkGray;
                  } else {
                    textColor = red;
                  }
                  return Text(
                    "OK",
                    style: GoogleFonts.syncopate(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  );
                }),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(); // dismisses only the dialog and returns nothing
                },
              ),
            ],
          );
        });
    return const Text("Error");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeModeCubit, ModeState>(builder: (context, state) {
      Color backgroundColor, cardColor, buttonColor, buttonTextColor;
      if (state is DarkModeState) {
        backgroundColor = black;
        cardColor = darkGray;
        buttonColor = red;
        buttonTextColor = Colors.white;
      } else {
        backgroundColor = Colors.white;
        cardColor = red;
        buttonColor = Colors.white;
        buttonTextColor = red;
      }
      return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
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
                        Navigator.pushReplacement(
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
            SizedBox(
              height: MediaQuery.of(context).size.height / 14,
            ),
            Expanded(
              child: Stack(clipBehavior: Clip.none, children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(42),
                        topRight: Radius.circular(42),
                      ),
                      color: cardColor),
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuHome(
                                          screen: const HomeScreen(),
                                        )));
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                            size: 30,
                          )),
                    ],
                  ),
                ),
                Positioned(
                  top: -60,
                  left: 25,
                  right: 25,
                  bottom: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedRotation(
                            duration: const Duration(seconds: 1),
                            turns: turns,
                            child: Image.asset(
                              "assets/images/${widget.pizzaCard.image}",
                              width: 180,
                              height: 180,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(flex: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          l
                              ? InkWell(
                                  child: Selected(size: "L"),
                                  onTap: () {
                                    setState(() {
                                      xl = xxl = false;
                                      l = true;
                                      quantity = 1;
                                      price = double.parse(productsSizesInfo[0]
                                              ['price']
                                          .toString());
                                      productSizeId =
                                          productsSizesInfo[0]['id'];
                                    });
                                  },
                                )
                              : InkWell(
                                  child: NotSelectedSize(size: "L"),
                                  onTap: () {
                                    setState(() {
                                      xl = xxl = false;
                                      l = true;
                                      quantity = 1;
                                      price = double.parse(productsSizesInfo[0]
                                              ['price']
                                          .toString());
                                      productSizeId =
                                          productsSizesInfo[0]['id'];
                                    });
                                  },
                                ),
                          const SizedBox(
                            width: 24,
                          ),
                          xl
                              ? InkWell(
                                  child: Selected(size: "XL"),
                                  onTap: () {
                                    setState(() {
                                      l = xxl = false;
                                      xl = true;
                                      quantity = 1;
                                      price = double.parse(productsSizesInfo[1]
                                              ['price']
                                          .toString());
                                      productSizeId =
                                          productsSizesInfo[1]['id'];
                                    });
                                  })
                              : InkWell(
                                  child: NotSelectedSize(size: "XL"),
                                  onTap: () {
                                    setState(() {
                                      l = xxl = false;
                                      xl = true;
                                      quantity = 1;
                                      price = double.parse(productsSizesInfo[1]
                                              ['price']
                                          .toString());
                                      productSizeId =
                                          productsSizesInfo[1]['id'];
                                    });
                                  }),
                          const SizedBox(
                            width: 24,
                          ),
                          xxl
                              ? InkWell(
                                  child: Selected(size: "XXL"),
                                  onTap: () {
                                    setState(() {
                                      l = xl = false;
                                      xxl = true;
                                      quantity = 1;
                                      price = double.parse(productsSizesInfo[2]
                                              ['price']
                                          .toString());
                                      productSizeId =
                                          productsSizesInfo[2]['id'];
                                    });
                                  },
                                )
                              : InkWell(
                                  child: NotSelectedSize(size: "XXL"),
                                  onTap: () {
                                    setState(() {
                                      l = xl = false;
                                      xxl = true;
                                      quantity = 1;
                                      price = double.parse(productsSizesInfo[2]
                                              ['price']
                                          .toString());
                                      productSizeId =
                                          productsSizesInfo[2]['id'];
                                    });
                                  },
                                )
                        ],
                      ),
                      const Spacer(flex: 3),
                      Text(
                        "0${widget.pizzaCard.id}",
                        style: GoogleFonts.orbitron(
                            color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        widget.pizzaCard.name,
                        style: GoogleFonts.preahvihear(
                            color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        widget.pizzaCard.description,
                        style: GoogleFonts.syncopate(
                            color: Colors.white, fontSize: 14),
                      ),
                      const Spacer(flex: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (quantity != 1) {
                                    quantity--;
                                  }
                                });
                              },
                              icon: const CircleAvatar(
                                backgroundColor: Colors.white38,
                                radius: 24,
                                child: Icon(Icons.remove, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "$quantity",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              icon: const CircleAvatar(
                                backgroundColor: Colors.white38,
                                radius: 24,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(flex: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (price * quantity).toStringAsFixed(2),
                            style: const TextStyle(
                                fontFamily: 'Righteous',
                                fontSize: 42,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "\$",
                            style: TextStyle(
                                fontFamily: 'Righteous',
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Spacer(flex: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              int orderId = 0;
                              if (emptyCart) {
                                emptyCart = false;
                                orderId =
                                    await ItemsDatabase.getNewId("Orders");
                                await ItemsDatabase.insertData("Orders", {
                                  "id": "$orderId",
                                  "client_email": "'mary2002saad@gmail.com'",
                                });
                              } else {
                                List<Map<String, dynamic>> clientOrders =
                                    await ItemsDatabase.getDataWhere(
                                        "Orders",
                                        "client_email",
                                        ["'mary2002saad@gmail.com'"]);
                                log(emptyCart.toString());
                                orderId =
                                    clientOrders[clientOrders.length - 1]['id'];
                              }
                              try {
                                int r = await ItemsDatabase.updateQuantity(
                                    quantity, productSizeId, orderId);
                              } catch (e) {
                                int orderItemsId =
                                    await ItemsDatabase.getNewId("orderItems");
                                await ItemsDatabase.insertData(
                                  "orderItems",
                                  {
                                    "id": "$orderItemsId",
                                    "order_id": "$orderId",
                                    "item_size_id": "$productSizeId",
                                    "quantity": "$quantity"
                                  },
                                );
                              }

                              showDialogMessage = true;
                              await showMessage();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10),
                              decoration: BoxDecoration(
                                  color: buttonColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "ADD",
                                style: GoogleFonts.orbitron(
                                    color: buttonTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigatorBar(
          screen: PlanetPizza(
            pizzaCard: widget.pizzaCard,
          ),
          darkBackColor: darkGray,
          lightBackColor: red,
          lightIconsColor: Colors.white,
        ),
      );
    });
  }
}
