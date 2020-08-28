import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:StarWarsAPIThreads/view/Planets/widgets/listofPlanets.dart';
import 'package:StarWarsAPIThreads/viewModel/characters.dart';
import 'package:StarWarsAPIThreads/viewModel/planets.dart';
import 'package:flutter/material.dart';

class Planets extends StatefulWidget {
  @override
  _PlanetsState createState() => _PlanetsState();
}

class _PlanetsState extends State<Planets> {
   @override
  void initState() {
    initPlanMethod();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextStrings().planets),
      ),
      body: Center(
        child: ListOfPlanets(),
      ),
    );
  }
}
