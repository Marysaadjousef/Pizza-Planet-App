import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pizza_planet/components/home_list_item.dart';
import '../models/pizzacard_model.dart';
import '../screens/planet_pizza_home_screen.dart';

class HomeListView extends StatelessWidget {
  HomeListView(
      {super.key,
      required this.height,
      required this.width,
      required this.productsList});
  final double height, width;
  List<ProductCard> productsList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(right: 25),
      clipBehavior: Clip.antiAlias,
      itemCount: productsList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context1, index) {
        return HomeListItem(
          index:
              productsList[0].image.compareTo(HomeScreen.pizzaList[0].image) ==
                      0
                  ? index
                  : (index + HomeScreen.pizzaList.length),
          category:
              productsList[0].image.compareTo(HomeScreen.pizzaList[0].image) ==
                      0
                  ? "pizza"
                  : "dessert",
          height: height,
          width: width,
          context: context,
          turns: 1,
          productsList: productsList,
        );
      },
    );
  }
}
