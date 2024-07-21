import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_cubit.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_states.dart';

import '../constants/colors.dart';
import '../screens/menu_home.dart';
import '../screens/planet_pizza_home_screen.dart';
import '../screens/shared.dart';

class BottomNavigatorBar extends StatelessWidget {
  BottomNavigatorBar(
      {super.key,
      required this.screen,
      required this.darkBackColor,
      required this.lightBackColor,
      this.lightIconsColor = iconsColor});
  Color lightBackColor, darkBackColor, lightIconsColor;
  Widget screen;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeModeCubit, ModeState>(builder: (context, state) {
      Color backgroundColor;
      if (state is DarkModeState) {
        backgroundColor = darkBackColor;
      } else {
        backgroundColor = lightBackColor;
      }
      return BottomNavigationBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.list_rounded,
                  color: lightIconsColor,
                  size: 30,
                ),
                onPressed: () {
                  isCollapsed = !isCollapsed;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MenuHome(screen: screen)));
                },
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.place_rounded,
                  color: lightIconsColor,
                  size: 30,
                ),
                onPressed: () {},
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  radius: 15,
                  backgroundColor: lightIconsColor,
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
          ]);
    });
  }
}
