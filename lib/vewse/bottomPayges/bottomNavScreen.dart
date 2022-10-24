

import 'package:e_comearce/vewse/bottomPayges/profileScreen.dart';
import 'package:e_comearce/vewse/bottomPayges/settingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helper/bottom_controler.dart';
import 'dasbordScreen.dart';
import 'homeScreen.dart';

class BottomNavScreen extends StatelessWidget {
   BottomNavScreen({Key? key}) : super(key: key);
  final bottomcontroler=Get.put(BottomControler()) ;
  final RxInt _currentIndex =0.obs;
   final payges=[
     HomeScreen(),
      DasbordScreen(),
      SettingsScreen(),
       ProfileScreen(),
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Obx(()=>payges[_currentIndex.value],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          _currentIndex.value = index;
        },
        currentIndex: _currentIndex.value,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_travel_outlined),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile"
          ),
        ],
      ),
    );
  }
}
