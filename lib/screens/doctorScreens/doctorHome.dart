import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital/components/nfcComponents.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({super.key});

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  String data = "";

  void functionCallback() async {
    String dataa = await StartNFCReading();
    setState(() {
      data = dataa;
    });
    if (data == "Error") {
      print("Dialog");
      ShowNFCDialog(context, "Place Card First");
    } else {
      ShowNFCDialog(context, data);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white.withAlpha(110),
        elevation: 10,
        shadowColor: Colors.black,
        title: Text(
          "DOCTOR",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.blue.shade800),
        ),
        actions: [
          IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              icon: const Icon(
                weight: 40,
                fill: 0.9,
                Icons.exit_to_app,
                size: 28,
                color: Colors.deepPurple,
              ))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).orientation == Orientation.landscape
              ? size.height * 1.3
              : size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/3763028.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "NUMBER OF PATIENTS ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.blue.shade800),
                        ),
                        const Text(
                          "1300",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.deepPurple),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "NUMBER OF NURSES ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.blue.shade800),
                        ),
                        const Text(
                          "125",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.deepPurple),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getNfcReader(context, size, "SCAN CARD", functionCallback),
                  getNfcReader(context, size, "UPDATE PATIENT DETAILS",
                      functionCallback),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
