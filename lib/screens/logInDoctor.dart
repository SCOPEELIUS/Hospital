import 'package:flutter/material.dart';

class DoctorLogIn extends StatefulWidget {
  const DoctorLogIn({super.key});

  @override
  State<DoctorLogIn> createState() => _DoctorLogInState();
}

class _DoctorLogInState extends State<DoctorLogIn> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.all(8),
        height: size.height * 0.3,
        width: size.width * 0.4,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/10035102.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
          ),
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
        child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              "AS A NURSE",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 18),
            )),
      ),
    );
  }
}
