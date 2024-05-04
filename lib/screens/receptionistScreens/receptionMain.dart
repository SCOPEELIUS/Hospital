import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hospital/httpFuncts/sockets.dart';
import 'package:hospital/provider/doctorsProvider.dart';
import 'package:hospital/provider/networkProvider.dart';
import 'package:hospital/provider/nursesProvider.dart';
import 'package:hospital/provider/patientsProvider.dart';
import 'package:hospital/provider/userProvider.dart';
import 'package:hospital/provider/wardsProvider.dart';
import 'package:hospital/screens/receptionistScreens/receptionDoctors.dart';
import 'package:hospital/screens/receptionistScreens/receptionHome.dart';
import 'package:hospital/screens/receptionistScreens/receptionNurses.dart';
import 'package:hospital/screens/receptionistScreens/receptionPatients.dart';
import 'package:provider/provider.dart';

class ReceptionMain extends StatefulWidget {
  const ReceptionMain({super.key});

  @override
  State<ReceptionMain> createState() => _ReceptionMainState();
}

class _ReceptionMainState extends State<ReceptionMain>
    with TickerProviderStateMixin {
  bool theme = false;
  bool socketReload = true;
  bool inits = true;
  late final List<Widget> _widgets = [];
  int _currentPage = 0;
  TCPClient tcpSocket = TCPClient();
  late Widget _currentWidget;
  Future<void> loadData() async {
    var conn = Provider.of<ConnectivityProvider>(context, listen: true);
    conn.start(context);
    if (conn.status == ConnectivityStatus.online) {
      var nursesProvider = Provider.of<NursesProvider>(context, listen: true);
      var doctorsProvider = Provider.of<DoctorsProvider>(context, listen: true);
      var ward = Provider.of<WardProvider>(context, listen: true);
      var patientsProvider =
          Provider.of<PatientsProvider>(context, listen: true);
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      await patientsProvider.getAllPatients();
      await doctorsProvider.getAllDoctors();
      await nursesProvider.getAllNurses();
      await ward.getAllWards();
      if (socketReload == true) {
        tcpSocket.connect(newId: userProvider.user.id ?? "");

        socketReload = false;
      }
      setState(() {
        socketReload = false;
        inits = false;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (inits) {
      loadData();
    }
  }

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
    var conn = Provider.of<ConnectivityProvider>(context, listen: false);
    conn.start(context);
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: _currentWidget,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(110),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
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
