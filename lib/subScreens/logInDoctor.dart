import 'package:flutter/material.dart';
import 'package:hospital/components/loginComponents.dart';

class DoctorLogIn extends StatefulWidget {
  const DoctorLogIn({super.key});

  @override
  State<DoctorLogIn> createState() => _DoctorLogInState();
}

class _DoctorLogInState extends State<DoctorLogIn> {
  final _passWord = TextEditingController();
  final _email = TextEditingController();
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
            image: AssetImage("assets/5008219.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
          color: Colors.white,
        ),
        child: getLogin("DOCTOR", context, _formKey, _email, _passWord),
      ),
    );
  }
}
