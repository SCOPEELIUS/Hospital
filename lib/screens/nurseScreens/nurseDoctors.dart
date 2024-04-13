import 'package:flutter/material.dart';

class NurseDoctors extends StatefulWidget {
  const NurseDoctors({super.key});

  @override
  State<NurseDoctors> createState() => _NurseDoctorsState();
}

class _NurseDoctorsState extends State<NurseDoctors> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Nurse Doctors"),
      ),
    );
  }
}
