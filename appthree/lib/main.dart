import 'package:appthree/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart'; 
import 'package:themify_flutter/themify_flutter.dart';

void main() => runApp(MaterialApp(
    title: "GNav",
    theme: ThemeData(
      primaryColor: Color.fromRGBO(6, 155, 252,1),
    ),
    home: Example()));

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 1: Likes',
      style: optionStyle,
    ),
    Text(
      'Index 2: Search',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
    Text(
      'Index 4: Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.05))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 20,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Color.fromRGBO(6, 155, 252,1),
                tabs: [
                  GButton(
                    icon: Themify.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Themify.heart,
                    text: 'Likes',
                  ),
                  GButton(
                    icon: Themify.search,
                    text: 'Search',
                  ),
                  GButton(
                    icon: Themify.user,
                    text: 'Profile',
                  ),
                  GButton(
                    icon: Themify.settings,
                    text: 'Settings',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}