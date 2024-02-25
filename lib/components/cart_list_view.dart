import 'package:flutter/material.dart';

import '../network/local/local_data.dart';
import '../screens/cart.dart';
import 'cart_item.dart';

class CartListView extends StatefulWidget {
  const CartListView({super.key});

  @override
  State<CartListView> createState() => _CartListViewState();

}

class _CartListViewState extends State<CartListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: Cart.items.length,
        itemBuilder: (context, index) {
          print("index = $index");
          return Dismissible(
              key: Key('index ${Cart.items[index].id}'),
          onDismissed: (direction) {
          setState(() {
          LocalData.deleteFromCart(Cart.items[index]);
          Cart.items.removeAt(index);
          });
          },child:CartItem(index: index));
        });
  }
}
