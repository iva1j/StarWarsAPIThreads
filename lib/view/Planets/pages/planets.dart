import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:flutter/material.dart';

class Planets extends StatefulWidget {
  @override
  _PlanetsState createState() => _PlanetsState();
}

class _PlanetsState extends State<Planets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextStrings().planets),
      ),
      body: Center(
        child: Text(TextStrings().planList),
      ),
    );
  }
}
