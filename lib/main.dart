import 'package:StarWarsAPIThreads/model/charactersModel.dart';
import 'package:StarWarsAPIThreads/model/planetsModel.dart';
import 'package:StarWarsAPIThreads/model/shipsModel.dart';
import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:StarWarsAPIThreads/view/Shared/bottomNavBarProvider.dart';
import 'package:StarWarsAPIThreads/view/Shared/tabNavigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<CharactersModel>(
          create: (_) => CharactersModel(),
        ),
        ListenableProvider<PlanetsModel>(
          create: (_) => PlanetsModel(),
        ),
        ListenableProvider<ShipsModel>(
          create: (_) => ShipsModel(),
        ),
      ],
      child: MaterialApp(
        title: TextStrings().starWars,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: ChangeNotifierProvider<BottomNavigationBarProvider>(
          child: SWBottomNavigationBar(),
          create: (BuildContext context) => BottomNavigationBarProvider(),
        ),
      ),
    );
  }
}
