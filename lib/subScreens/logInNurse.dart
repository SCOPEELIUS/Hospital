import 'package:flutter/material.dart';
import 'package:hospital/components/loginComponents.dart';

class NurseLogIn extends StatefulWidget {
  const NurseLogIn({super.key});

  @override
  State<NurseLogIn> createState() => _NurseLogInState();
}

class _NurseLogInState extends State<NurseLogIn> {
  var _passWord = TextEditingController();
  var _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).orientation == Orientation.landscape
              ? size.height * 1.3
              : size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/10035102.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
          color: Colors.white,
        ),
        child: getLogin("NURSE", context, _formKey, _email, _passWord),
      ),
    );
  }
}
