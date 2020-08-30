import 'package:StarWarsAPIThreads/model/characterModel.dart';
import 'package:flutter/material.dart';

class CharactersDetails extends StatelessWidget {
  const CharactersDetails({
    Key key,
    @required this.details,
  }) : super(key: key);
  final CharacterModel details;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Height: ' + details.height),
              Text('Hair color: ' + details.hairColor),
              Text('Skin color: ' + details.skinColor),
              Divider(),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Eye color: ' + details.eyeColor),
              Text('Birth year: ' + details.birthYear),
              Text('Gender: ' + details.gender),
              Divider(),
            ],
          ),
        ],
      ),
    );
  }
}
