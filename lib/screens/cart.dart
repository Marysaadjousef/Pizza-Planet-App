import 'package:course/network/local/local_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../components/cart_item.dart';
import '../constants/colors.dart';
import '../models/cart_full_model.dart';

class Cart extends StatefulWidget {
  static List<PizzaCardFullData> items = [];

  const Cart({super.key});

  @override
  State<StatefulWidget> createState() => _Cart();
}

class _Cart extends State<Cart> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Cart.items = [];
    List<Map<String, dynamic>> orders = await LocalData.getDataWhere(
        "Orders", "client_email", ["'mary2002saad@gmail.com'"]);
    print(orders);
    for (Map<String, dynamic> row in orders) {
      List<Map<String, dynamic>> ordersItems = await LocalData.getDataWhere(
          "orderItems", "order_id", ["${row['id']}"]);
      print(ordersItems);
      for (Map<String, dynamic> row2 in ordersItems) {
        List<Map<String, dynamic>> pizzaSizes = await LocalData.getDataWhere(
            "PizzaSizes", "id", ["${row2['pizza_size_id']}"]);
        List<Map<String, dynamic>> pizzaInfo = await LocalData.getDataWhere(
            "Pizza", "id", ["${pizzaSizes[0]['pizza_id']}"]);
        Cart.items.add(PizzaCardFullData(
            pizzaSizeId: row2['pizza_size_id'],
            name: pizzaInfo[0]["name"],
            description: pizzaInfo[0]["description"],
            image: pizzaInfo[0]["image"],
            quantity: row2["quantity"],
            size: pizzaSizes[0]["size"],
            price: pizzaSizes[0]["price"],
            orderId: row['id'],
            id: pizzaSizes[0]['pizza_id']));
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Cart",
                style: GoogleFonts.orbitron(
                    color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Cart.items.isNotEmpty
                ? Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
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
                                  },
                                  child: CartItem(index: index));
                            }),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: MaterialButton(
                          onPressed: () {},
                          color: darkMode? darkGray: red,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Buy",
                            style: GoogleFonts.preahvihear(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                  
                    ],
                  ),
                )
                : Align(
                  alignment: Alignment.center,
                  child: Center(child: Lottie.asset("assets/lotties/Animation - 1708695004243.json"))
                ),

          ],
        ),
      ),
    );
  }
}
