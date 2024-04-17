import 'package:flutter/material.dart';
import 'package:hospital/components/patientDetails.dart';

class Patient extends StatefulWidget {
  const Patient({super.key});

  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white.withAlpha(110),
        elevation: 10,
        shadowColor: Colors.black,
        title: Text(
          "PATIENT DETAILS",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.blue.shade800),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: size.width * 0.3,
              backgroundImage:
                  AssetImage("assets/0684456b-aa2b-4631-86f7-93ceaf33303c.jpg"),
            ),
            getBox("Name", "Joshua Sakweli"),
            getBox("Contacts", "076848363"),
            getBox("Admition Date", "30-04-2004"),
            getBox("Blood Group", "Blood Group O"),
            getBox("Assigned Doctor", "Onisa Mapunda"),
            getBox("Assigned Nurse", "Delvina Joshua")
          ],
        ),
      )),
    );
  }
}
