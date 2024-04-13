import 'package:flutter/material.dart';

class ReceptionDoctors extends StatefulWidget {
  const ReceptionDoctors({super.key});

  @override
  State<ReceptionDoctors> createState() => _ReceptionDoctorsState();
}

class _ReceptionDoctorsState extends State<ReceptionDoctors> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Reception Doctors"),
      ),
    );
  }
}
