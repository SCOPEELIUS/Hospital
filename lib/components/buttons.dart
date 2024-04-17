import 'package:flutter/material.dart';

Widget getDropDown(
    List<String> options, String text, void Function(String) callback) {
  return DropdownButton<String>(
    iconEnabledColor: Colors.deepPurple,
    iconSize: 40,
    borderRadius: BorderRadius.circular(30),
    underline: Container(
      // Customize underline
      height: 2,
      color: Colors.blue,
    ),
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 28,
      color: Colors.deepPurple,
    ),
    value: text,
    onChanged: (String? newValue) {
      callback(newValue!);
    },
    items: options.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}
