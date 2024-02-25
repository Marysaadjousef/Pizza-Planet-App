import 'package:course/components/pizza_list_view.dart';
import 'package:course/screens/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../models/card.dart';
import 'cart.dart';
import 'menu_home.dart';


class PizzaHomeScreen extends StatefulWidget {
  static List<PizzaCard> list  = [];
  const PizzaHomeScreen({super.key});

  @override
  State<PizzaHomeScreen> createState() => _PizzaHomeScreenState();
}

class _PizzaHomeScreenState extends State<PizzaHomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: darkMode? black: Colors.white,
        child: Column(
            children: [
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
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=> Cart()));
                    },
                    icon: Icon(Icons.shopping_cart,
                    color: red,
                    size: 30,
                    )
                  )
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
                      color: darkMode? darkGray: Colors.black,
                    ),
                    child:
                        Stack(
                          alignment: Alignment.center,
                          children: [
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: darkMode? darkGray: red, width: 2))),
                                child: Text(
                                  "MOST POPULAR",
                                  style: GoogleFonts.orbitron(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Spacer(flex: 3,),
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
                                    style: GoogleFonts.orbitron(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "1x Soda 50cl",
                                    style: GoogleFonts.orbitron(color: Colors.white),
                                  ),
                                ],
                              ),
                              const Spacer(flex: 4,),
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
                              const Spacer(flex: 2,),
                            ],
                          ),
                          Positioned(
                            bottom: -16,
                            right: 45,
                            child: Transform.rotate(
                              angle: -0.25,
                              child: Image.asset(
                                "assets/images/pngwing2.com.png",
                                width: 146,
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
                        ],)
                  ),
                  Positioned(
                    bottom: -20,
                    child: MaterialButton(
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
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
                  Text(
                    "PIZZAS",
                    style: GoogleFonts.orbitron(
                        color: darkMode? Colors.white: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "MENUS",
                    style: GoogleFonts.orbitron(
                        color: darkMode? Colors.white70: Colors.black26, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "DRINKS",
                    style: GoogleFonts.orbitron(
                        color: darkMode? Colors.white70: Colors.black26, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "DESSERTS",
                    style: GoogleFonts.orbitron(
                        color: darkMode? Colors.white70: Colors.black26, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            SizedBox(
              height: height / 3,
              child: PizzaListView(height: height, width: width)
            ),
            const Spacer(
              flex: 1,
            ),

            ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: darkMode? black: Colors.white,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.list_rounded,
                  color: darkMode? darkGray: red,
                  size: 30,
                ),
                onPressed: () {
                    isCollapsed = !isCollapsed;
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => MenuHome(screen: const PizzaHomeScreen())));
                },
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.place_rounded,
                  color: darkMode? darkGray: red,
                  size: 30,
                ),
                onPressed: (){},
              ),
              label: "",
            ),
            BottomNavigationBarItem(

              icon: IconButton(
                onPressed: (){},
                icon: CircleAvatar(
                  radius: 15,
                  backgroundColor: darkMode? darkGray: red,
                  child: ClipOval(
                      child: Image.asset(
                        "assets/images/Crystal Earrings _ GRAZIA Magazine _ Fashion Editorial Photo Shoot.jpeg",
                        width: 29,
                        height: 29,
                        fit: BoxFit.fill,

                      )),
                ),
              ),
              label: "",
            ),
          ]),
    );
  }
}
