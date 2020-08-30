import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:StarWarsAPIThreads/view/Characters/widgets/backgroundImage.dart';
import 'package:StarWarsAPIThreads/view/Ships/widgets/listOfShips.dart';
import 'package:StarWarsAPIThreads/viewModel/ships.dart';
import 'package:flutter/material.dart';

class Ships extends StatefulWidget {
  @override
  _ShipsState createState() => _ShipsState();
}

class _ShipsState extends State<Ships> {
  @override
  void initState() {
    initShipsMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundImage(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(TextStrings().ships),
        ),
        body: Center(
          child: ListOfShips(),
        ),
      ),
    );
  }
}
