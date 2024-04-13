import 'package:flutter/material.dart';

class DoctorNurses extends StatefulWidget {
  const DoctorNurses({super.key});

  @override
  State<DoctorNurses> createState() => _DoctorNursesState();
}

class _DoctorNursesState extends State<DoctorNurses> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Doctor Nurses"),
      ),
    );
  }
}
