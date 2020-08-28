import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShipsDetails extends StatelessWidget {
  const ShipsDetails({
    Key key,
    @required this.names,
    @required this.index,
  }) : super(key: key);

  final names;
  final int index;
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
                Text('Model: ' + names[index]['model'].toString()),
                Text(
                    'Manufacturer: ' + names[index]['manufacturer'].toString()),
                Text('Cost_in_credits: ' +
                    names[index]['cost_in_credits'].toString()),
                Divider()
              ],
            ),
            VerticalDivider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Passengers: ' + names[index]['passengers'].toString()),
                Text('Crew: ' + names[index]['crew'].toString()),
                Text('Length: ' + names[index]['length'].toString()),
                Divider()
              ],
            ),
          ],
        ));
  }
}
