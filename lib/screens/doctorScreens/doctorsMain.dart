import 'package:flutter/material.dart';
import 'package:hospital/screens/doctorScreens/doctorHome.dart';
import 'package:hospital/screens/doctorScreens/doctorNurses.dart';
import 'package:hospital/screens/doctorScreens/doctorPatients.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DoctorsMain extends StatefulWidget {
  const DoctorsMain({super.key});

  @override
  State<DoctorsMain> createState() => _DoctorsMainState();
}

class _DoctorsMainState extends State<DoctorsMain>
    with TickerProviderStateMixin {
  bool theme = false;
  late List<Widget> _widgets = [];
  int _currentPage = 0;
  late Widget _currentWidget;

  @override
  void initState() {
    _widgets
      ..add(const DoctorHome())
      ..add(const DoctorNurses())
      ..add(const DoctorPatients());
    super.initState();

    _currentWidget = _widgets[_currentPage];
  }

  void changePage(int value) {
    setState(() {
      _currentPage = value;
      _currentWidget = _widgets[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: _currentWidget,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(210),
          boxShadow: const [
            BoxShadow(
                offset: Offset(-2, 3),
                color: Colors.grey,
                blurRadius: 8,
                spreadRadius: -2),
          ],
        ),
        child: GNav(
          selectedIndex: _currentPage,
          onTabChange: changePage,
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[100]!,
          gap: 8,
          activeColor: Colors.deepPurple,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Colors.grey[400]!,
          color: Colors.black,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.person,
              text: "Nurses",
            ),
            GButton(
              icon: Icons.bed,
              text: "Patients",
            ),
          ],
        ),
      ),
    );
  }
}
