import 'package:StarWarsAPIThreads/model/shipsModel.dart';
import 'package:StarWarsAPIThreads/view/Characters/widgets/backgroundImage.dart';
import 'package:StarWarsAPIThreads/view/Ships/widgets/listOfShips.dart';
import 'package:StarWarsAPIThreads/viewModel/ships.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Ships extends StatefulWidget {
  @override
  _ShipsState createState() => _ShipsState();
}

class _ShipsState extends State<Ships> {
  @override
  void initState() {
    if (Provider.of<ShipsModel>(context, listen: false).isShipsEmpty())
      initShips(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundImage(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Starships"),
        ),
        body: Center(
          child: Consumer<ShipsModel>(
            builder: (context, ships, child) => ListOfShips(
              ships: ships.allShips,
              generatingFavorites: false,
            ),
          ),
        ),
      ),
    );
  }
}
