import 'package:StarWarsAPIThreads/model/planetsModel.dart';
import 'package:StarWarsAPIThreads/utils/colors.dart';
import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:StarWarsAPIThreads/view/Planets/widgets/listofPlanets.dart';
import 'package:StarWarsAPIThreads/viewModel/planets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Planets extends StatefulWidget {
  @override
  _PlanetsState createState() => _PlanetsState();
}

class _PlanetsState extends State<Planets> {
  @override
  void initState() {
    if (Provider.of<PlanetsModel>(context, listen: false).isPlanetsEmpty())
      initPlanets(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(BottomNavbarIconURLs().background),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Planets"),
          backgroundColor: barColor,
        ),
        body: Center(
          child: Consumer<PlanetsModel>(
            builder: (context, planets, child) => ListOfPlanets(
              planets: planets.allPlanets,
              generatingFavorites: false,
            ),
          ),
        ),
      ),
    );
  }
}
