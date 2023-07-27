import 'package:flutter/material.dart';
import 'package:stock/Screens/Add.dart';
import 'package:stock/Screens/History.dart';
import 'package:stock/Screens/Home.dart';
import 'package:stock/Screens/Item.dart';
import 'package:stock/Screens/setting.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

class bottom extends StatefulWidget {
  @override
  _bottomState createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  int _currentIndex = 0;

  final List<Widget> bottomBarPages = [
    const  home(),
    const item(),
    const add(),
    const history(),
    const setting(),
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
