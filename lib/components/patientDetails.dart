import 'package:flutter/material.dart';

Widget getBox(String text, String text2) {
  return Container(
    padding:const EdgeInsets.all(8),
    margin:const EdgeInsets.only(right: 20, left: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style:const TextStyle(fontSize: 20),
            ),
            Text(
              text2,
              style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const Divider()
      ],
    ),
  );
}
