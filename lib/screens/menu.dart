// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pizza_planet/screens/shared.dart';
//
// import '../constants/colors.dart';
// import '../helper_functions/dark_mode_functions.dart';
// import 'cart.dart';
//
// class Menu extends StatefulWidget {
//   const Menu({super.key});
//
//   @override
//   State<Menu> createState() => _MenuState();
// }
//
// class _MenuState extends State<Menu> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(top: 50, left: 25),
//       width: (0.55 * MediaQuery.of(context).size.width),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "MENU",
//             style: GoogleFonts.orbitron(
//               color: darkMode ? red : Colors.white,
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const Spacer(
//             flex: 1,
//           ),
//           InkWell(
//             onTap: () {
//               isCollapsed = true;
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const Cart()));
//             },
//             child: ListTile(
//               leading: Icon(
//                 Icons.shopping_cart,
//                 color: darkMode ? iconsColor : Colors.white,
//               ),
//               title: Text(
//                 "Your Cart",
//                 style: GoogleFonts.orbitron(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.location_on_rounded,
//               color: darkMode ? iconsColor : Colors.white,
//             ),
//             title: Text(
//               "Delivery Address",
//               style: GoogleFonts.orbitron(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               setState(() {
//                 darkMode = !darkMode;
//               });
//               // toggleDarkMode(darkMode);
//             },
//             child: ListTile(
//               leading: Icon(
//                 Icons.dark_mode_rounded,
//                 color: darkMode ? iconsColor : Colors.white,
//               ),
//               title: Text(
//                 "Dark Mode",
//                 style: GoogleFonts.orbitron(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.person,
//               color: darkMode ? iconsColor : Colors.white,
//             ),
//             title: Text(
//               "Profile",
//               style: GoogleFonts.orbitron(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.settings,
//               color: darkMode ? iconsColor : Colors.white,
//             ),
//             title: Text(
//               "Settings",
//               style: GoogleFonts.orbitron(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           const Spacer(
//             flex: 4,
//           ),
//         ],
//       ),
//     );
//   }
// }
