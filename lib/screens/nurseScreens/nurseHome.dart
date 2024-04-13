import 'package:flutter/material.dart';

class NurseHome extends StatefulWidget {
  const NurseHome({super.key});

  @override
  State<NurseHome> createState() => _NurseHomeState();
}

class _NurseHomeState extends State<NurseHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Nurse Home"),),
    );
  }
}