import 'package:flutter/material.dart';

import 'BottomNavBarItem.dart';

class AppData {
  AppData._();

  static List<BottomNavBarItem> bottomNavBarItems = [
    BottomNavBarItem("Home", Icon(Icons.home), activeColor: Colors.deepOrange),
    BottomNavBarItem(
      "Favorite",
      Icon(Icons.favorite),
      activeColor: Colors.deepOrange,
    ),
    BottomNavBarItem(
      "Cart",
      Icon(Icons.shopping_cart),
      activeColor: Colors.deepOrange,
    ),
    BottomNavBarItem(
      "Profile",
      Icon(Icons.person),
      activeColor: Colors.deepOrange,
    ),
  ];
}
