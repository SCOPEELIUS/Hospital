import 'package:flutter/material.dart';
import 'package:hospital/models/userModel.dart';
import 'package:hospital/models/ward.dart';

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

Widget getDropDownUsers(List<User?> options, TextEditingController text,
    void Function(String) callback) {
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
    value: text.text,
    onChanged: (String? newValue) {
      callback(newValue ?? "");
    },
    items: options.map((User? user) {
      return DropdownMenuItem(
        value: user!.email,
        child: Text(user.firstName ?? ""),
      );
    }).toList(),
  );
}

Widget getDropDownWards(List<Ward?> options, TextEditingController text,
    void Function(String) callback) {
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
    value: text.text,
    onChanged: (String? newValue) {
      callback(newValue ?? "");
    },
    items: options.map((Ward? ward) {
      return DropdownMenuItem(
        value: ward!.id ?? "",
        child: Text(ward.wardName ?? ""),
      );
    }).toList(),
  );
}
