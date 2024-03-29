import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/widgets/destination_carousel.dart';
import 'package:travel_ui/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index 
                  ? Theme.of(context).accentColor 
                  : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0)
        ),
        child: Icon(
          icons[index],
          size: 25.0,
          color: _selectedIndex == index 
                  ? Theme.of(context).primaryColor 
                  : Color(0xFFB4C1C4)
        )
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( 
        child: ListView(  
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget> [
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                "What you would like to find ?",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(height: 20.0),
            DestinationCarosuel(),
            HotelCarousel()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.flight_takeoff,
              size: 30,
            ),
            title: SizedBox.shrink()
          ), 
        ],
      )
    );
  }
}