import 'package:flutter/material.dart';

class DoctorPatients extends StatefulWidget {
  const DoctorPatients({super.key});

  @override
  State<DoctorPatients> createState() => _DoctorPatientsState();
}

class _DoctorPatientsState extends State<DoctorPatients> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Doctor Patients"),
      ),
    );
  }
}
