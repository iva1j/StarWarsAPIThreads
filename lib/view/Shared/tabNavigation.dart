import 'package:StarWarsAPIThreads/utils/colors.dart';
import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:StarWarsAPIThreads/view/Favorites/favorites.dart';
import 'package:StarWarsAPIThreads/view/Shared/bottomNavBarProvider.dart';
import 'package:flutter/material.dart';
import 'package:StarWarsAPIThreads/view/Characters/pages/characters.dart'
    as chars;
import 'package:StarWarsAPIThreads/view/planets/pages/planets.dart';
import 'package:StarWarsAPIThreads/view/Ships/pages/ships.dart';
import 'package:provider/provider.dart';

class SWBottomNavigationBar extends StatefulWidget {
  @override
  _SWBottomNavigationBarState createState() => _SWBottomNavigationBarState();
}

class _SWBottomNavigationBarState extends State<SWBottomNavigationBar> {
  var currentTab = [
    chars.Characters(),
    Planets(),
    Ships(),
    Favorites(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: barColor,
        onTap: (index) {
          provider.currentIndex = index;
        },
        currentIndex: provider.currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                BottomNavbarIconURLs().yoda,
                height: 25,
              ),
              title: Text(
                TextStrings().characters,
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
            ),
          ),
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
