import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'GroceryApp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedPage = 0;
  final _pageOptions = [
    HomePage(),
    GroceryApp(),
    Text('Scan'),//ScanPage(),
    Text('Profile'),//ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 30.0,
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.black),
              label: 'home',
              activeIcon: Icon(Icons.home, color: Colors.black),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
              label: 'grocery',
              activeIcon: Icon(Icons.shopping_cart, color: Colors.black),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_overscan_outlined, color: Colors.black),
              label: 'scan',
              activeIcon:
              Icon(Icons.settings_overscan_outlined, color: Colors.black),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, color: Colors.black),
              label: 'account',
              activeIcon: Icon(Icons.account_circle, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

