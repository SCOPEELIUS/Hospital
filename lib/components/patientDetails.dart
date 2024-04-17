import 'package:flutter/material.dart';

Widget getBox(String text, String text2) {
  return Container(
    padding: EdgeInsets.all(8),
    margin: EdgeInsets.only(right: 20, left: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              text2,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Divider()
      ],
    ),
  );
}
