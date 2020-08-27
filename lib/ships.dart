import 'package:flutter/material.dart';

class Ships extends StatefulWidget {
  @override
  _ShipsState createState() => _ShipsState();
}

class _ShipsState extends State<Ships> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ships'),
      ),
      body: Center(
        child: Text('List of ships'),
      ),
    );
  }
}
