import 'package:flutter/material.dart';

class ReceptionNurses extends StatefulWidget {
  const ReceptionNurses({super.key});

  @override
  State<ReceptionNurses> createState() => _ReceptionNursesState();
}

class _ReceptionNursesState extends State<ReceptionNurses> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Reception Nurses"),
      ),
    );
  }
}
