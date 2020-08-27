import 'package:StarWarsAPIThreads/characters.dart';
import 'package:StarWarsAPIThreads/favorites.dart';
import 'package:StarWarsAPIThreads/planets.dart';
import 'package:StarWarsAPIThreads/shared/strings.dart';
import 'package:StarWarsAPIThreads/ships.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars',
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
                yoda,
                height: 25,
              ),
              title: Text('characters')),
          BottomNavigationBarItem(
              icon: Image.asset(
                planet,
                height: 25,
              ),
              title: Text('planets')),
          BottomNavigationBarItem(
              icon: Image.asset(
                starship,
                height: 25,
              ),
              title: Text('ships')),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              size: 25,
              color: Colors.black,
            ),
            title: Text("favorites"),
          ),
        ],
      ),
    );
  }
}
