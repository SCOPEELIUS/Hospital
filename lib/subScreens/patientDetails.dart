import 'package:flutter/material.dart';
import 'package:hospital/components/patientDetails.dart';
import 'package:hospital/provider/doctorsProvider.dart';
import 'package:hospital/provider/networkProvider.dart';
import 'package:hospital/provider/nursesProvider.dart';
import 'package:hospital/provider/patientProvider.dart';
import 'package:hospital/provider/patientsProvider.dart';
import 'package:hospital/provider/wardsProvider.dart';
import 'package:provider/provider.dart';

class Patient extends StatefulWidget {
  const Patient({super.key});

  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  String ward = "";
  String doctor = "";
  String nurse = "";
  @override
  void initState() {
    super.initState();
    var patientProvider = Provider.of<PatientProvider>(context, listen: false);
    var wardProvider = Provider.of<WardProvider>(context, listen: false);
    ward = wardProvider
            .getWardFromId(patientProvider.patient.id ?? "")
            ?.wardName ??
        "";
    var doctorsProvider = Provider.of<DoctorsProvider>(context, listen: false);
    var nursesProvider = Provider.of<NursesProvider>(context, listen: false);
    doctor = doctorsProvider
            .getDoctorNameById(patientProvider.patient.doctorId ?? "") ??
        "";
    nurse =
        nursesProvider.getNurseById(patientProvider.patient.nurseId ?? "") ??
            "";
  }

  @override
  Widget build(BuildContext context) {
    var patientProvider = Provider.of<PatientProvider>(context, listen: true);
    var conn = Provider.of<ConnectivityProvider>(context, listen: false);
    conn.start(context);
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
              backgroundImage: const AssetImage(
                  "assets/0684456b-aa2b-4631-86f7-93ceaf33303c.jpg"),
            ),
            getBox("First name", patientProvider.patient.firstName ?? ""),
            getBox("Second name", patientProvider.patient.secondName ?? ""),
            getBox("Age", patientProvider.patient.age ?? ""),
            getBox("Card Id", patientProvider.patient.carId ?? ""),
            getBox("Ward name", patientProvider.patient.carId ?? ""),
            getBox("Admition Date", patientProvider.patient.createdAt ?? ""),
            getBox("Assigned Doctor", doctor),
            getBox("Assigned Nurse", nurse)
          ],
        ),
      )),
    );
  }
}
