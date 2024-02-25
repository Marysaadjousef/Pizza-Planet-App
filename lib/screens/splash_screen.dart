import 'package:course/screens/planet_pizza_home_screen.dart';
import 'package:flutter/material.dart';
import '../models/card.dart';
import '../network/local/local_data.dart';
import 'menu_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getData().then((value) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MenuHome(screen: const PizzaHomeScreen()))));
  }

  Future<int> getData() async {
    WidgetsFlutterBinding.ensureInitialized();
    await LocalData.createTables();
    List<Map<String,dynamic>> l= await LocalData.getTableData("PizzaSizes");
    if(l.isEmpty) {
    await LocalData.insertData("Clients", {"email":"mary2002saad@gmail.com","password":"123456","name":"Mary Saad"});
    await LocalData.insertData("Pizza", {"id": 1, "name": 'PLUTO',
      "description":
    'Tomatoes, mushrooms, peppers, cheese, olives and tomato sauce',
      "image": 'Pizza-Margherita-on-transparent-background-PNG.png'});
    await LocalData.insertData("Pizza", {"id": 2, "name": 'URANUS',
      "description":
      'Pepperoni, hams, cheese and tomato sauce',
      "image": "pngimg.com - pizza_PNG7130.png"});
    await LocalData.insertData("Pizza", {"id": 3, "name": 'PLUTO',
      "description":
      'Tomatoes, mushrooms, peppers, cheese, olives and tomato sauce',
      "image": "Hawaiian-pizza-isolated-on-transparent-background-PNG.png"});
    await LocalData.insertData("Pizza", {"id": 4, "name": 'URANUS',
      "description":
      'Pepperoni, hams, cheese and tomato sauce',
      "image": 'Pepperoni-Pizza-on-transparent-background-PNG.png'});
    await LocalData.insertData("Pizza", {"id": 5, "name": 'HEART',
      "description":
      'Heart pizza with mozzarella',
      "image": 'Heart-pizza-with-mozzarella---transparent-PNG.png'});

      int id = await LocalData.getNewId("PizzaSizes");
      await LocalData.insertData("PizzaSizes", {
        "id": "$id",
        "pizza_id": "1",
        "size": "L",
        "price": "8.99",
        "quantity": 40
      });
      id = await LocalData.getNewId("PizzaSizes");
      print("id2 $id");
      await LocalData.insertData("PizzaSizes", {
        "id": "$id",
        "pizza_id": "1",
        "size": "XL",
        "price": "9.5",
        "quantity": 30
      });
      id = await LocalData.getNewId("PizzaSizes");
      await LocalData.insertData("PizzaSizes", {
        "id": "$id",
        "pizza_id": "1",
        "size": "XXL",
        "price": "10.99",
        "quantity": 15
      });
      id = await LocalData.getNewId("PizzaSizes");
      await LocalData.insertData("PizzaSizes", {
        "id": "$id",
        "pizza_id": "2",
        "size": "L",
        "price": "7.5",
        "quantity": 10
      });
      id = await LocalData.getNewId("PizzaSizes");
      await LocalData.insertData("PizzaSizes", {
        "id": "$id",
        "pizza_id": "2",
        "size": "XL",
        "price": "8.90",
        "quantity": 22
      });
      id = await LocalData.getNewId("PizzaSizes");
      await LocalData.insertData("PizzaSizes", {
        "id": "$id",
        "pizza_id": "2",
        "size": "XXL",
        "price": "9.88",
        "quantity": 12
      });
      id = await LocalData.getNewId("PizzaSizes");
      await LocalData.insertData("PizzaSizes", {
        "id": "$id",
        "pizza_id": "3",
        "size": "L",
        "price": "9.99",
        "quantity": 40
      });
      id = await LocalData.getNewId("PizzaSizes");
      await LocalData.insertData("PizzaSizes", {
        "id": "$id",
        "pizza_id": "3",
        "size": "XL",
        "price": "10.99",
        "quantity": 30
      });
      id = await LocalData.getNewId("PizzaSizes");
      await LocalData.insertData("PizzaSizes", {
        "id": "$id",
        "pizza_id": "3",
        "size": "XXL",
        "price": "11.5",
        "quantity": 14
      });
      id = await LocalData.getNewId("PizzaSizes");
      await LocalData.insertData("PizzaSizes", {
        "id": "$id",
        "pizza_id": "4",
        "size": "L",
        "price": "7.00",
        "quantity": 18
      });
      id = await LocalData.getNewId("PizzaSizes");
      await LocalData.insertData("PizzaSizes", {
        "id": "$id",
        "pizza_id": "4",
        "size": "XL",
        "price": "8.99",
        "quantity": 50
      });
      id = await LocalData.getNewId("PizzaSizes");
      await LocalData.insertData("PizzaSizes", {
        "id": "$id",
        "pizza_id": "4",
        "size": "XXL",
        "price": "9.99",
        "quantity": 19
      });
      id = await LocalData.getNewId("PizzaSizes");
      await LocalData.insertData("PizzaSizes", {
        "id": "$id",
        "pizza_id": "5",
        "size": "L",
        "price": "6.99",
        "quantity": 60
      });
      id = await LocalData.getNewId("PizzaSizes");
      await LocalData.insertData("PizzaSizes", {
        "id": "$id",
        "pizza_id": "5",
        "size": "XL",
        "price": "8.99",
        "quantity": 40
      });
      id = await LocalData.getNewId("PizzaSizes");
      await LocalData.insertData("PizzaSizes", {
        "id": "$id",
        "pizza_id": "5",
        "size": "XXL",
        "price": "9.50",
        "quantity": 80
      });
    }
    List<Map<String, dynamic>> rows = await LocalData.getTableData("Pizza");
    for (var row in rows) {
      PizzaHomeScreen.list.add(PizzaCard.convertToObject(row));
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 30, 59, 1),
      body: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(
            "assets/images/Pizza-Planet-Emblem-500x281.png",
          ),
        ),
      ),
    );
  }
}
