import 'package:flutter/material.dart';
import 'package:hospital/provider/patientProvider.dart';
import 'package:hospital/provider/patientsProvider.dart';
import 'package:hospital/provider/userProvider.dart';
import 'package:hospital/provider/usersProvider.dart';
import 'package:hospital/subScreens/logInNurse.dart';
import 'package:hospital/subScreens/logInDoctor.dart';
import 'package:hospital/subScreens/logInReception.dart';
import 'package:hospital/subScreens/signUp.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserProvider()),
          ChangeNotifierProvider(create: (context) => UsersProvider()),
          ChangeNotifierProvider(create: (context) => PatientsProvider()),
          ChangeNotifierProvider(create: (context) => PatientProvider()),
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: const MyHomePage(),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/49093.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(10),
                width: size.width * 0.7,
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
                child: const Text(
                  "LOG IN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.blue),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.all(8),
                    height: size.height * 0.3,
                    width: size.width * 0.4,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/5008219.jpg"),
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.black12, BlendMode.darken),
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
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const DoctorLogIn()));
                        },
                        child: const Text(
                          "AS A DOCTOR",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 18),
                        )),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.all(8),
                    height: size.height * 0.3,
                    width: size.width * 0.4,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/10035102.jpg"),
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.black12, BlendMode.darken),
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
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const NurseLogIn()));
                        },
                        child: const Text(
                          "AS A NURSE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 18),
                        )),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.all(30),
                    height: size.height * 0.3,
                    width: size.width * 0.4,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/34818.jpg"),
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.black12, BlendMode.darken),
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
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ReceptionLogIn()));
                        },
                        child: const Text(
                          "AS A RECEPTIONIST",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.all(8),
                    height: size.height * 0.3,
                    width: size.width * 0.4,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/doctor_consultation_03.jpg"),
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.black12, BlendMode.darken),
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
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUp()));
                        },
                        child: const Text(
                          "REGISTER",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 18),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
