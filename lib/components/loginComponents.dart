import 'package:flutter/material.dart';
import 'package:hospital/httpFuncts/userHttp.dart';
import 'package:hospital/screens/doctorScreens/doctorsMain.dart';
import 'package:hospital/screens/nurseScreens/nursesMain.dart';
import 'package:hospital/screens/receptionistScreens/receptionMain.dart';

Widget getLogin(String text, BuildContext context, GlobalKey<FormState> formKey,
    TextEditingController email, TextEditingController passWord) {
  return Container(
    padding: const EdgeInsets.all(16),
    width: MediaQuery.of(context).size.width * 0.85,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.8),
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
    ),
    child: Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "LOG IN AS $text",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          TextFormField(
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
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              labelText: 'Email',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
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
              // Add more email validation logic if needed
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          TextFormField(
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
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              labelText: 'Password',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
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
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Form submitted')),
                  );
                  if (text == "DOCTOR") {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DoctorsMain()));
                  }
                  if (text == "NURSE") {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NurseMain()));
                  }
                  if (text == "RECEPTIONIST") {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ReceptionMain()));
                  }
                }
              },
              child: const Text(
                "Log In",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ))
        ],
      ),
    ),
  );
}

Widget getSignUp(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController email,
    TextEditingController passWord,
    TextEditingController passWord2,
    List<String> options,
    TextEditingController selectedOption,
    void Function(String) callback) {
  var userHttp = UserHttp();
  return Container(
    padding: const EdgeInsets.all(16),
    width: MediaQuery.of(context).size.width * 0.85,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.8),
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
    ),
    child: Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "REGISTER",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          TextFormField(
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
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              labelText: 'Email',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
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
              // Add more email validation logic if needed
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          TextFormField(
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
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              labelText: 'Password',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
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
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          TextFormField(
            cursorColor: Colors.blue,
            controller: passWord2,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.blue.withGreen(100),
            ),
            decoration: const InputDecoration(
              labelStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              labelText: 'Repeat Password',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              } else if (value.length < 6) {
                return 'Password must have atleast six characters ';
              } else if (passWord.text != passWord2.text) {
                return 'Password must match ';
              } else {
                return null;
              }
              // Add more email validation logic if needed
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          DropdownButton<String>(
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
              fontSize: 32,
              color: Colors.blue,
            ),
            value: selectedOption.text,
            onChanged: (String? newValue) {
              callback(newValue!);
            },
            items: options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          ElevatedButton(
              onPressed: () async {
                // var a = await userHttp.SetUser();
                // print("Response is $a");
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Form submitted')),
                  );
                }
              },
              child: const Text(
                "REGISTER",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              )),
        ],
      ),
    ),
  );
}
