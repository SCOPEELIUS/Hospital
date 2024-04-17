import 'package:flutter/material.dart';
import 'package:hospital/components/nfcComponents.dart';
import 'package:hospital/subScreens/patientAdmition.dart';

class ReceptionHome extends StatefulWidget {
  const ReceptionHome({super.key});

  @override
  State<ReceptionHome> createState() => _ReceptionHomeState();
}

class _ReceptionHomeState extends State<ReceptionHome> {
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
          "RECEPTION",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.blue.shade800),
        ),
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
              SizedBox(height: size.height * 0.09),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getNfcReader(context, size, "SCAN CARD", functionCallback),
                  getNfcReader(context, size, "ERASE CARD", functionCallback),
                ],
              ),
              SizedBox(height: size.height * 0.3),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      enableFeedback: true,
                      elevation: 10,
                      shadowColor: Colors.black),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PatientAdmittion()));
                  },
                  child: const Text(
                    "Admit patient",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 18),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
