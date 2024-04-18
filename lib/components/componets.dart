 import 'package:flutter/material.dart';

Container customContainer(Widget widget) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
              offset: Offset(-2, -2),
              spreadRadius: -2,
              blurRadius: 10,
              color: Colors.black,
              blurStyle: BlurStyle.solid),
          BoxShadow(
              offset: Offset(2, 2),
              spreadRadius: -2,
              blurRadius: 10,
              color: Colors.black,
              blurStyle: BlurStyle.solid),
        ],
      ),
      child: widget,
    );
  }
  Widget rowData(String text, String text1) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.blue.shade800),
            ),
            Text(
              text1,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.deepPurple),
            )
          ],
        ),
      const  Divider(),
      ],
    );
  }