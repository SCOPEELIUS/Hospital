import 'package:flutter/material.dart';

class ReceptionPatients extends StatefulWidget {
  const ReceptionPatients({super.key});

  @override
  State<ReceptionPatients> createState() => _ReceptionPatientsState();
}

class _ReceptionPatientsState extends State<ReceptionPatients> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Reception Patients"),
      ),
    );
  }
}
