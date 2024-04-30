// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital/components/componets.dart';
import 'package:hospital/components/indicators.dart';
import 'package:hospital/components/nfcComponents.dart';
import 'package:hospital/provider/doctorsProvider.dart';
import 'package:hospital/provider/networkProvider.dart';
import 'package:hospital/provider/nursesProvider.dart';
import 'package:hospital/provider/patientsProvider.dart';
import 'package:hospital/provider/userProvider.dart';
import 'package:hospital/provider/wardsProvider.dart';
import 'package:hospital/subScreens/patientAdmition.dart';
import 'package:hospital/subScreens/wardCreater.dart';
import 'package:provider/provider.dart';

class ReceptionHome extends StatefulWidget {
  const ReceptionHome({super.key});

  @override
  State<ReceptionHome> createState() => _ReceptionHomeState();
}

class _ReceptionHomeState extends State<ReceptionHome> {
  String data = "";

  @override
  Widget build(BuildContext context) {
    var nursesProvider = Provider.of<NursesProvider>(context, listen: true);
    var doctorsProvider = Provider.of<DoctorsProvider>(context, listen: true);
    var patientsProvider = Provider.of<PatientsProvider>(context, listen: true);
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    var conn = Provider.of<ConnectivityProvider>(context, listen: true);
    conn.start(context);
    var ward = Provider.of<WardProvider>(context, listen: true);
    var size = MediaQuery.of(context).size;
    void functionDeleteCallback() async {
      String dataa = await StartNFCReading();
      setState(() {
        data = dataa;
      });
      if (data == "Error") {
        showCustomSnackBar(context, "Place card first");
      } else if (conn.status == ConnectivityStatus.online && data != "Error") {
        bool res = await patientsProvider.removePatientWithId(data);
        if (res) {
          ShowNFCDialog(context, "Card Erased");
        } else {
          ShowNFCDialog(context, "Un assigned card");
        }
      } else {
        showCustomSnackBar(context, "Be online to erase card");
      }
    }

    void functionCallback() async {
      String dataa = await StartNFCReading();
      setState(() {
        data = dataa;
      });
      if (data == "Error") {
        showCustomSnackBar(context, "Place card first");
      } else {
        var res = patientsProvider.getPatientWithId(data);
        if (res != null && res.carId != null) {
          ShowNFCDialog(context, res.firstName ?? "");
        } else {
          ShowNFCDialog(context, "Un assigned card");
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white.withAlpha(110),
        elevation: 10,
        shadowColor: Colors.black,
        title: Text(
          "RECEPTIONIST",
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
                    rowData("NUMBER OF PATIENTS",
                        "${patientsProvider.patients.patients != null ? patientsProvider.patients.patients?.length : "0"}"),
                    rowData("NUMBER OF DOCTORS",
                        "${doctorsProvider.doctors.users != null ? doctorsProvider.doctors.users?.length : "0"}"),
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
                  getNfcReader(
                      context, size, "ERASE CARD", functionDeleteCallback),
                ],
              ),
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            enableFeedback: true,
                            elevation: 10,
                            shadowColor: Colors.black),
                        onPressed: () {
                          createWard(context);
                        },
                        child: const Text(
                          "Create New Ward",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                              fontSize: 18),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            enableFeedback: true,
                            elevation: 10,
                            shadowColor: Colors.black),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const PatientAdmittion()));
                        },
                        child: const Text(
                          "Admit patient",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                              fontSize: 18),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
