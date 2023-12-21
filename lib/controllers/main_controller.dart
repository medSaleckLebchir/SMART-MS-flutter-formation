import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';

class MainController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<Widget> pages = const [HomeScreen(), SearchScreen(), ProfileScreen()];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
