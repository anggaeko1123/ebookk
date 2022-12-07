import 'package:flutter/material.dart';
import 'package:myflutterapp/nyobaApi/model.dart';


Widget itemWisata(Datum data) {
  return Card(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Expanded(
          flex: 1,
          child: Image.network(data.mainImage),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  data.name,
                  style: const TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(data.location),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}