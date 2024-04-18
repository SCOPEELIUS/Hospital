// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hospital/components/indicators.dart';
import 'package:hospital/components/navigators.dart';
import 'package:hospital/components/textFormFields.dart';
import 'package:hospital/httpFuncts/userHttp.dart';
import 'package:hospital/models/accountTypes.dart';
import 'package:hospital/models/userModel.dart';
import 'package:hospital/provider/userProvider.dart';
import 'package:hospital/provider/usersProvider.dart';
import 'package:hospital/screens/doctorScreens/doctorsMain.dart';
import 'package:hospital/screens/nurseScreens/nursesMain.dart';
import 'package:hospital/screens/receptionistScreens/receptionMain.dart';
import 'package:provider/provider.dart';

Widget getLogin(String text, BuildContext context, GlobalKey<FormState> formKey,
    TextEditingController email, TextEditingController passWord) {
  var userProvider = Provider.of<UserProvider>(context, listen: false);
  var usersProvider = Provider.of<UsersProvider>(context, listen: false);
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
          getEmailForm(email),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          getPasswordField(passWord),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  showLoadingDialog(context);
                  var a = await userProvider.signIn(email.text, passWord.text);
                  usersProvider.getAllUsers();
                  Navigator.of(context).pop();
                  if (userProvider.logIn) {
                    showCustomSnackBar(context, "Welcome ");
                    switch (userProvider.user.accountType) {
                      case AccountType.doctor:
                        simpleNavigator(context, const DoctorsMain());
                        break;
                      case AccountType.nurse:
                        simpleNavigator(context, const NurseMain());
                        break;
                      case AccountType.reception:
                        simpleNavigator(context, const ReceptionMain());
                        break;
                    }
                  } else {
                    showCustomSnackBar(context, "Failed to LogIn");
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
    TextEditingController firstName,
    TextEditingController secondName,
    TextEditingController profession,
    TextEditingController email,
    TextEditingController passWord,
    List<String> options,
    TextEditingController selectedOption,
    void Function(String) callback) {
  var userProvider = Provider.of<UserProvider>(context, listen: false);
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          getTextForm(firstName, "First Name"),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          getTextForm(secondName, "Second Name"),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          getTextForm(profession, "Profession"),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          getEmailForm(email),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          getPasswordField(passWord),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
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
                if (formKey.currentState!.validate()) {
                  var newUser = User(
                    firstName: firstName.text,
                    lastName: secondName.text,
                    email: email.text,
                    password: passWord.text,
                    speciality: profession.text,
                    accountType: selectedOption.text,
                  );
                  showLoadingDialog(context);
                  var result = await userProvider.signUp(newUser);
                  Navigator.of(context).pop();
                  if (result) {
                    print(userProvider.user.accountType);
                    switch (userProvider.user.accountType) {
                      case AccountType.doctor:
                        simpleNavigator(context, const DoctorsMain());
                        break;
                      case AccountType.nurse:
                        simpleNavigator(context, const NurseMain());
                        break;
                      case AccountType.reception:
                        simpleNavigator(context, const ReceptionMain());
                        break;
                    }
                    showCustomSnackBar(context, "Welcome");
                  } else {
                    showCustomSnackBar(context, "Failed To Register");
                  }
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
