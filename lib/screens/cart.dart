import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_cubit.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_states.dart';
import 'package:pizza_planet/screens/shared.dart';
import '../components/cart_item.dart';
import '../constants/colors.dart';
import '../models/cart_full_model.dart';
import '../network/local/pizza_database.dart';
import 'Delivery.dart';

class Cart extends StatefulWidget {
  static List<PizzaCardFullData> items = [];

  const Cart({super.key});

  @override
  State<StatefulWidget> createState() => _Cart();
}

class _Cart extends State<Cart> {
  double totalPrice = 0.0;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Cart.items = [];
    List<Map<String, dynamic>> orders = await ItemsDatabase.getDataWhere(
        "Orders", "client_email", ["'mary2002saad@gmail.com'"]);
    log(orders.toString());
    for (Map<String, dynamic> row in orders) {
      List<Map<String, dynamic>> ordersItems = await ItemsDatabase.getDataWhere(
          "orderItems", "order_id", ["${row['id']}"]);
      print(ordersItems);
      for (Map<String, dynamic> row2 in ordersItems) {
        List<Map<String, dynamic>> itemSizes = await ItemsDatabase.getDataWhere(
            "ItemSizes", "id", ["${row2['item_size_id']}"]);
        List<Map<String, dynamic>> pizzaInfo = await ItemsDatabase.getDataWhere(
            "Item", "id", ["${itemSizes[0]['item_id']}"]);
        Cart.items.add(PizzaCardFullData(
            category: "pizza",
            pizzaSizeId: row2['item_size_id'],
            name: pizzaInfo[0]["name"],
            description: pizzaInfo[0]["description"],
            image: pizzaInfo[0]["image"],
            quantity: row2["quantity"],
            size: itemSizes[0]["size"],
            price: itemSizes[0]["price"].toDouble(),
            orderId: row['id'],
            id: itemSizes[0]['item_id']));
        totalPrice += itemSizes[0]["price"].toDouble() * row2["quantity"];
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeModeCubit, ModeState>(builder: (context, state) {
      Color backgroundColor, buttonColor;
      if (state is DarkModeState) {
        backgroundColor = black;
        buttonColor = darkGray;
      } else {
        backgroundColor = Colors.white;
        buttonColor = red;
      }
      return Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Cart.items.isNotEmpty
              ? Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Cart",
                          style: GoogleFonts.orbitron(
                              color: Colors.red,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: Cart.items.length,
                                itemBuilder: (context, index) {
                                  return Dismissible(
                                      key: Key('index ${Cart.items[index].id}'),
                                      onDismissed: (direction) {
                                        setState(() {
                                          totalPrice -=
                                              Cart.items[index].quantity *
                                                  Cart.items[index].price;
                                          ItemsDatabase.deleteFromCart(
                                              Cart.items[index]);
                                          Cart.items.removeAt(index);
                                        });
                                        emptyCart = Cart.items.isEmpty;
                                      },
                                      child: CartItem(index: index));
                                }),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const Delivery();
                                }));
                              },
                              color: buttonColor,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                "Total : ${(totalPrice).toStringAsFixed(2)}",
                                style: GoogleFonts.preahvihear(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Cart",
                          style: GoogleFonts.orbitron(
                              color: Colors.red,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Image.asset("assets/images/Take Away-amico.png"),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
        ),
      );
    });
  }
}
