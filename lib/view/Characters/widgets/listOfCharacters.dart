import 'package:StarWarsAPIThreads/model/people.dart';
import 'package:StarWarsAPIThreads/utils/globalVariables.dart';
import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:StarWarsAPIThreads/view/Characters/widgets/charactersDetails.dart';
import 'package:flutter/material.dart';

class ListOfCharacters extends StatefulWidget {
  const ListOfCharacters({
    Key key,
  }) : super(key: key);

  @override
  _ListOfCharactersState createState() => _ListOfCharactersState();
}

class _ListOfCharactersState extends State<ListOfCharacters> {
  @override
  Widget build(BuildContext context) {
    var names;
    return FutureBuilder<StarWarsModel>(
      future: getCharacters,
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
                    CharactersDetails(names: names, index: index),
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