import 'package:flutter/material.dart';

const borderDeco = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(30)));

const focustBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 3),
    borderRadius: BorderRadius.all(Radius.circular(30)));

Widget getEmailForm(TextEditingController email) {
  return TextFormField(
    cursorColor: Colors.blue,
    controller: email,
    keyboardType: TextInputType.emailAddress,
    textAlign: TextAlign.start,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.blue.withGreen(100),
    ),
    decoration: const InputDecoration(
      labelStyle: TextStyle(
          color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
      enabledBorder: borderDeco,
      labelText: 'Email',
      focusedBorder: focustBorder,
    ),
    validator: (value) {
      RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (value!.isEmpty) {
        return 'Please enter your email';
      } else if (!emailRegex.hasMatch(value)) {
        return 'Please enter a valid email';
      } else {
        return null;
      }
    },
  );
}

TextFormField getPasswordField(TextEditingController passWord) {
  return TextFormField(
    cursorColor: Colors.blue,
    controller: passWord,
    keyboardType: TextInputType.text,
    textAlign: TextAlign.start,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.blue.withGreen(100),
    ),
    decoration: const InputDecoration(
      labelStyle: TextStyle(
          color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
      enabledBorder: borderDeco,
      labelText: 'Password',
      focusedBorder: focustBorder,
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Please enter your password';
      } else if (value.length < 6) {
        return 'Password must have atleast six characters ';
      } else {
        return null;
      }
      // Add more email validation logic if needed
    },
  );
}

Widget getTextForm(TextEditingController textController, String text) {
  return TextFormField(
    cursorColor: Colors.blue,
    controller: textController,
    keyboardType: TextInputType.text,
    textAlign: TextAlign.start,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.blue.withGreen(100),
    ),
    decoration: InputDecoration(
      labelStyle: const TextStyle(
          color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
      enabledBorder: borderDeco,
      labelText: text,
      focusedBorder: focustBorder,
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Please Fill';
      } else {
        return null;
      }
    },
  );
}
