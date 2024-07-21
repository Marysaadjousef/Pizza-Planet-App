import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_cubit.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_states.dart';
import 'package:pizza_planet/screens/planet_pizza_home_screen.dart';
import '../constants/colors.dart';
import '../models/pizzacard_model.dart';
import '../network/local/pizza_database.dart';
import 'menu_home.dart'; // Import your screens if needed

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> loadData() async {
    WidgetsFlutterBinding.ensureInitialized();
    await ItemsDatabase.createTables();
    List<Map<String, dynamic>> l =
        await ItemsDatabase.getTableData("ItemSizes");
    if (l.isEmpty) {
      await ItemsDatabase.insertData("Clients", {
        "email": "mary2002saad@gmail.com",
        "password": "123456",
        "name": "Mary Saad"
      });
      await ItemsDatabase.insertData("Item", {
        "id": 1,
        "name": 'PLUTO',
        "description":
            'Tomatoes, mushrooms, peppers, cheese, olives and tomato sauce',
        "image": 'Pizza-Margherita-on-transparent-background-PNG.png',
        "category": 'pizza'
      });
      await ItemsDatabase.insertData("Item", {
        "id": 2,
        "name": 'URANUS',
        "description": 'Pepperoni, hams, cheese and tomato sauce',
        "image": "pngimg.com - pizza_PNG7130.png",
        "category": 'pizza'
      });
      await ItemsDatabase.insertData("Item", {
        "id": 3,
        "name": 'PLUTO',
        "description":
            'Tomatoes, mushrooms, peppers, cheese, olives and tomato sauce',
        "image": "Hawaiian-pizza-isolated-on-transparent-background-PNG.png",
        "category": 'pizza'
      });
      await ItemsDatabase.insertData("Item", {
        "id": 4,
        "name": 'URANUS',
        "description": 'Pepperoni, hams, cheese and tomato sauce',
        "image": 'Pepperoni-Pizza-on-transparent-background-PNG.png',
        "category": 'pizza'
      });
      await ItemsDatabase.insertData("Item", {
        "id": 5,
        "name": 'HEART',
        "description": 'Heart pizza with mozzarella',
        "image": 'Heart-pizza-with-mozzarella---transparent-PNG.png',
        "category": 'pizza'
      });

      int id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "Item_id": "1",
        "size": "L",
        "price": "8.99",
        "quantity": 40
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "1",
        "size": "XL",
        "price": "9.5",
        "quantity": 30
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "1",
        "size": "XXL",
        "price": "10.99",
        "quantity": 15
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "2",
        "size": "L",
        "price": "7.5",
        "quantity": 10
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "2",
        "size": "XL",
        "price": "8.90",
        "quantity": 22
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "2",
        "size": "XXL",
        "price": "9.88",
        "quantity": 12
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "3",
        "size": "L",
        "price": "9.99",
        "quantity": 40
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "3",
        "size": "XL",
        "price": "10.99",
        "quantity": 30
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "3",
        "size": "XXL",
        "price": "11.5",
        "quantity": 14
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "4",
        "size": "L",
        "price": "7.00",
        "quantity": 18
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "4",
        "size": "XL",
        "price": "8.99",
        "quantity": 50
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "4",
        "size": "XXL",
        "price": "9.99",
        "quantity": 19
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "5",
        "size": "L",
        "price": "6.99",
        "quantity": 60
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "5",
        "size": "XL",
        "price": "8.99",
        "quantity": 40
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "5",
        "size": "XXL",
        "price": "9.50",
        "quantity": 80
      });

      await ItemsDatabase.insertData("Item", {
        "id": 6,
        "name": 'CLASSIC GLAZED',
        "description":
            'A soft, fluffy donut with a light and sweet vanilla glaze that melts in your mouth',
        "image":
            'Dunkin\' Donuts Malaysia - World\'s leading baked goods and coffee chain (8).png',
        "category": 'donuts'
      });
      await ItemsDatabase.insertData("Item", {
        "id": 7,
        "name": 'CHOCOLATE FROSTED',
        "description":
            'A rich and decadent donut topped with smooth, creamy chocolate frosting',
        "image":
            "Dunkin Donuts Malaysia leading baked goods and coffee chain (2).png",
        "category": 'donuts'
      });
      await ItemsDatabase.insertData("Item", {
        "id": 8,
        "name": 'CINNAMON SUGAR',
        "description":
            'A warm, aromatic donut coated in a perfect blend of cinnamon and sugar',
        "image":
            "DunkinDonuts Malaysia - Worlds leading baked goods and coffee chain (5).png",
        "category": 'donuts'
      });
      await ItemsDatabase.insertData("Item", {
        "id": 9,
        "name": 'DOUBLE CHOCOLATE',
        "description":
            'A chocolate donut with a rich chocolate glaze and chocolate chips sprinkled on top',
        "image":
            'DunkinDonuts Malaysia - Worlds leading baked goods and coffee chain (4).png',
        "category": 'donuts'
      });
      await ItemsDatabase.insertData("Item", {
        "id": 10,
        "name": 'STRAWBERRY',
        "description": 'A vibrant, fun donut covered in pink strawberry icing',
        "image":
            'Dunkin\' Donuts Malaysia - World\'s leading baked goods and coffee chain (1).png',
        "category": 'donuts'
      });

      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "Item_id": "6",
        "size": "L",
        "price": "8.99",
        "quantity": 40
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      print("id2 $id");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "6",
        "size": "XL",
        "price": "9.5",
        "quantity": 30
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "6",
        "size": "XXL",
        "price": "10.99",
        "quantity": 15
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "7",
        "size": "L",
        "price": "7.5",
        "quantity": 10
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "7",
        "size": "XL",
        "price": "8.90",
        "quantity": 22
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "7",
        "size": "XXL",
        "price": "9.88",
        "quantity": 12
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "8",
        "size": "L",
        "price": "9.99",
        "quantity": 40
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "8",
        "size": "XL",
        "price": "10.99",
        "quantity": 30
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "8",
        "size": "XXL",
        "price": "11.5",
        "quantity": 14
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "9",
        "size": "L",
        "price": "7.00",
        "quantity": 18
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "9",
        "size": "XL",
        "price": "8.99",
        "quantity": 50
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "9",
        "size": "XXL",
        "price": "9.99",
        "quantity": 19
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "10",
        "size": "L",
        "price": "6.99",
        "quantity": 60
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "10",
        "size": "XL",
        "price": "8.99",
        "quantity": 40
      });
      id = await ItemsDatabase.getNewId("ItemSizes");
      await ItemsDatabase.insertData("ItemSizes", {
        "id": "$id",
        "item_id": "10",
        "size": "XXL",
        "price": "9.50",
        "quantity": 80
      });
    }
    List<Map<String, dynamic>> rows = await ItemsDatabase.getTableData("Item");
    List<Map<String, dynamic>> prices =
        await ItemsDatabase.getDataWhere("ItemSizes", "size", ["L"]);
    int i = 0;
    for (var row in rows) {
      ProductCard productCard = ProductCard.convertToObject(
          row, double.parse(prices[i]["price"].toString()));

      if (productCard.category == "pizza") {
        HomeScreen.pizzaList.add(productCard);
      } else if (productCard.category == "donuts") {
        HomeScreen.dessertList.add(productCard);
      }
      i++;
    }
    print("data loading");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData().then((value) => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return MenuHome(screen: const HomeScreen());
        })));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeModeCubit, ModeState>(builder: (context, state) {
      Color backgroundColor;
      if (state is DarkModeState) {
        backgroundColor = black;
      } else {
        backgroundColor = red;
      }
      return Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: SizedBox(
              height: 90,
              child:
                  Image.asset("assets/images/Pizza-Planet-Emblem-500x281.png")),
        ),
      );
    });
  }
}
