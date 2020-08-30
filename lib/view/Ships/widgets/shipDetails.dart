import 'package:StarWarsAPIThreads/model/shipModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShipsDetails extends StatelessWidget {
  const ShipsDetails({
    Key key,
    @required this.details,
  }) : super(key: key);

  final ShipModel details;
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
                Text('Model: ' + details.model),
                Text('Manufacturer: ' + details.manufacturer),
                Text('Cost_in_credits: ' + details.costInCredits),
                Divider()
              ],
            ),
            VerticalDivider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Passengers: ' + details.passengers),
                Text('Crew: ' + details.crew),
                Text('Length: ' + details.length),
                Divider()
              ],
            ),
          ],
        ));
  }
}
