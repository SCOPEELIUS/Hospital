import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital/components/componets.dart';
import 'package:hospital/components/nfcComponents.dart';
import 'package:hospital/provider/nursesProvider.dart';
import 'package:hospital/provider/patientsProvider.dart';
import 'package:hospital/provider/userProvider.dart';
import 'package:hospital/provider/wardsProvider.dart';
import 'package:provider/provider.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({super.key});

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  String data = "";

  void functionCallback() async {
    String dataa = await StartNFCReading();
    setState(() {
      data = dataa;
    });
    if (data == "Error") {
   
      ShowNFCDialog(context, "Place Card First");
    } else {
      ShowNFCDialog(context, data);
    }
  }

  @override
  Widget build(BuildContext context) {
    var nursesProvider = Provider.of<NursesProvider>(context, listen: true);
    var patientsProvider =
        Provider.of<PatientsProvider>(context, listen: false);
    var userProvider = Provider.of<UserProvider>(context, listen: true);
    var ward = Provider.of<WardProvider>(context, listen: true);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white.withAlpha(110),
        elevation: 10,
        shadowColor: Colors.black,
        title: Text(
          "DOCTOR",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.blue.shade800),
        ),
        actions: [
          IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              icon: const Icon(
                weight: 40,
                fill: 0.9,
                Icons.exit_to_app,
                size: 28,
                color: Colors.deepPurple,
              ))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).orientation == Orientation.landscape
              ? size.height * 1.3
              : size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/3763028.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customContainer(Text(
                userProvider.user.firstName ?? "",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.blue.shade800),
              )),
              customContainer(
                Column(
                  children: [
                    rowData("NUMBER OF PATIENTS ",
                        "${patientsProvider.patients.patients != null ? patientsProvider.patients.patients?.length : "0"}"),
                    rowData("NUMBER OF NURSES",
                        "${nursesProvider.nurses.users != null ? nursesProvider.nurses.users?.length : "0"}"),
                    rowData("AVAILABLE WARDS", "${ward.wards.wards.length}"),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getNfcReader(context, size, "SCAN CARD", functionCallback),
                  getNfcReader(context, size, "UPDATE PATIENT DETAILS",
                      functionCallback),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
