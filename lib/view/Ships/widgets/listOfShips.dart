import 'package:StarWarsAPIThreads/model/people.dart';
import 'package:StarWarsAPIThreads/utils/globalVariables.dart';
import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:StarWarsAPIThreads/view/Ships/widgets/shipDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListOfShips extends StatefulWidget {
  @override
  _ListOfShipsState createState() => _ListOfShipsState();
}

class _ListOfShipsState extends State<ListOfShips> {
  @override
  Widget build(BuildContext context) {
    var names;
    return FutureBuilder<StarWarsModel>(
      future: getShips,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          names = snapshot.data.name;
          return ListView.builder(
              itemCount: names.length,
              itemBuilder: (BuildContext _, int index) {
                return ExpansionTile(
                  trailing: Icon(Icons.arrow_drop_down_circle),
                  backgroundColor: Colors.green[100],
                  leading: IconButton(icon: Icon(Icons.star), onPressed: () {}),
                  title: Text(names[index]['name'].toString()),
                  children: <Widget>[
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ShipsDetails(names: names, index: index),
                    ),
                  ],
                );
              });
        } else if (snapshot.hasError) {
          return Text(FutureBuilderStrings().error(snapshot));
        }
        return CircularProgressIndicator();
      },
    );
  }
}
