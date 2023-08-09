import 'package:flutter/material.dart';
import 'package:stock/Screens/add.dart';

import 'package:stock/Screens/Home.dart';
import 'package:stock/Screens/Item.dart';
import 'package:stock/Screens/setting.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

import 'Screens/History.dart';

class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _currentIndex = 0;

  final List<Widget> bottomBarPages = [
    Home(),
    Item(),
    Add(),
    History(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 222, 228, 255),
        body: bottomBarPages[_currentIndex],
        bottomNavigationBar: FloatingNavbar(
          onTap: (int val) => setState(() => _currentIndex = val),
          currentIndex: _currentIndex,
          items: [
            FloatingNavbarItem(icon: Icons.home, title: 'Home'),
            FloatingNavbarItem(icon: Icons.shopping_basket, title: 'Item'),
            FloatingNavbarItem(
              icon: Icons.add,
              title: 'Add',
            ),
            FloatingNavbarItem(icon: Icons.history, title: 'History'),
            FloatingNavbarItem(icon: Icons.settings, title: 'Setting'),
          ],
        ),
      ),
    );
  }
}
