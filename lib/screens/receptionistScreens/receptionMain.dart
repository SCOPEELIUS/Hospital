import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hospital/screens/receptionistScreens/receptionDoctors.dart';
import 'package:hospital/screens/receptionistScreens/receptionHome.dart';
import 'package:hospital/screens/receptionistScreens/receptionNurses.dart';
import 'package:hospital/screens/receptionistScreens/receptionPatients.dart';

class ReceptionMain extends StatefulWidget {
  const ReceptionMain({super.key});

  @override
  State<ReceptionMain> createState() => _ReceptionMainState();
}

class _ReceptionMainState extends State<ReceptionMain>
    with TickerProviderStateMixin {
  bool theme = false;
  late List<Widget> _widgets = [];
  int _currentPage = 0;
  late Widget _currentWidget;

  @override
  void initState() {
    _widgets
      ..add(const ReceptionHome())
      ..add(const ReceptionPatients())
      ..add(const ReceptionDoctors())
      ..add(const ReceptionNurses());
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
      body: _currentWidget,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(110),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: 0,
                blurRadius: 15,
                color: Colors.black45.withBlue(90),
                blurStyle: BlurStyle.solid),
          ],
        ),
        child: GNav(
          selectedIndex: _currentPage,
          onTabChange: changePage,
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[100]!,
          gap: 8,
          activeColor: Colors.blue,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Colors.white.withAlpha(100),
          color: Colors.black,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.bed,
              text: "Patients",
            ),
            GButton(
              icon: Icons.school,
              text: "Doctors",
            ),
            GButton(
              icon: Icons.person,
              text: "Nurses",
            ),
          ],
        ),
      ),
    );
  }
}
