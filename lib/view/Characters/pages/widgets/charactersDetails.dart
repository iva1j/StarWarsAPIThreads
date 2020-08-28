import 'package:flutter/material.dart';

class CharactersDetails extends StatelessWidget {
  const CharactersDetails({
    Key key,
    @required this.names,
    @required this.index,
  }) : super(key: key);
  final int index;
  final names;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Height: ' + names[index]['height'].toString()),
            Text('Hair color: ' + names[index]['hair_color'].toString()),
            Text('Skin color: ' + names[index]['skin_color'].toString()),
            Divider()
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Eye color: ' + names[index]['eye_color'].toString()),
            Text('Birth year: ' + names[index]['birth_year'].toString()),
            Text('Gender: ' + names[index]['gender'].toString()),
            Divider()
          ],
        ),
      ],
    );
  }
}
