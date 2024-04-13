import 'package:flutter/material.dart';

class NursePatients extends StatefulWidget {
  const NursePatients({super.key});

  @override
  State<NursePatients> createState() => _NursePatientsState();
}

class _NursePatientsState extends State<NursePatients> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Nurse Patients"),
      ),
    );
  }
}
