import 'package:course/components/pizza_list_item.dart';
import 'package:flutter/material.dart';

import '../screens/planet_pizza_home_screen.dart';

class PizzaListView extends StatelessWidget {
  const PizzaListView({super.key, required this.height, required this.width});
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(right: 25),
      clipBehavior: Clip.antiAlias,
      itemCount: PizzaHomeScreen.list.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context1, index) {
        return PizzaListItem(index: index, height: height, width: width, context: context, turns: 1,);
      },
    );
  }
}

