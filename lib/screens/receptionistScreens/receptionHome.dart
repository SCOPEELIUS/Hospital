import 'package:flutter/material.dart';

class ReceptionHome extends StatefulWidget {
  const ReceptionHome({super.key});

  @override
  State<ReceptionHome> createState() => _ReceptionHomeState();
}

class _ReceptionHomeState extends State<ReceptionHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Reception Home"),
      ),
    );
  }
}
