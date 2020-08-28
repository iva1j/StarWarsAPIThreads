import 'package:StarWarsAPIThreads/model/people.dart';
import 'package:StarWarsAPIThreads/utils/globalVariables.dart';
import 'package:StarWarsAPIThreads/utils/strings.dart';
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
    return FutureBuilder<People>(
      future: getCharacters,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          names = snapshot.data.charName;
          return ListView.builder(
              itemCount: names.length,
              itemBuilder: (BuildContext _, int index) {
                return ListTile(
                  leading: IconButton(icon: Icon(Icons.star), onPressed: () {}),
                  title: Text(names[index]['name'].toString()),
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
