import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:StarWarsAPIThreads/view/Characters/pages/characters.dart';
import 'package:StarWarsAPIThreads/view/Favorites/favorites.dart';
import 'package:StarWarsAPIThreads/view/planets/pages/planets.dart';
import 'package:StarWarsAPIThreads/view/Ships/pages/ships.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TextStrings().starWars,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SWBottomNavigationBar(),
    );
  }
}

class SWBottomNavigationBar extends StatefulWidget {
  @override
  _SWBottomNavigationBarState createState() => _SWBottomNavigationBarState();
}

class _SWBottomNavigationBarState extends State<SWBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Characters(),
    Planets(),
    Ships(),
    Favorites(),
  ];

  void bottomNavBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: bottomNavBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                BottomNavbarIconURLs().yoda,
                height: 25,
              ),
              title: Text(
                TextStrings().charactets,
                style: TextStyle(color: Colors.black),
              )),
          BottomNavigationBarItem(
              icon: Image.asset(
                BottomNavbarIconURLs().planet,
                height: 25,
              ),
              title: Text(
                TextStrings().planets,
                style: TextStyle(color: Colors.black),
              )),
          BottomNavigationBarItem(
              icon: Image.asset(
                BottomNavbarIconURLs().starship,
                height: 25,
              ),
              title: Text(
                TextStrings().ships,
                style: TextStyle(color: Colors.black),
              )),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              size: 25,
              color: Colors.black,
            ),
            title: Text(
              TextStrings().favorites,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
