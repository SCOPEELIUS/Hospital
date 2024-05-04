import 'package:flutter/material.dart';
import 'package:hospital/components/buttons.dart';
import 'package:hospital/components/indicators.dart';
import 'package:hospital/components/nfcComponents.dart';
import 'package:hospital/components/textFormFields.dart';
import 'package:hospital/httpFuncts/patientHttp.dart';
import 'package:hospital/models/patientModel.dart';
import 'package:hospital/provider/doctorsProvider.dart';
import 'package:hospital/provider/networkProvider.dart';
import 'package:hospital/provider/nursesProvider.dart';
import 'package:hospital/provider/patientProvider.dart';
import 'package:hospital/provider/patientsProvider.dart';
import 'package:hospital/provider/wardsProvider.dart';
import 'package:provider/provider.dart';
// import 'package:hospital/subScreens/patientDetails.dart';

class PatientAdmittion extends StatefulWidget {
  const PatientAdmittion({super.key});

  @override
  State<PatientAdmittion> createState() => _PatientAdmittionState();
}

class _PatientAdmittionState extends State<PatientAdmittion> {
  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final secondName = TextEditingController();
  double op = 0.1;
  final age = TextEditingController();
  final cardId = TextEditingController();
  final nurseId = TextEditingController();
  final doctorId = TextEditingController();
  final doctorSelectedOption = TextEditingController();
  final nurseSelectedOption = TextEditingController();
  final wardSelectedOption = TextEditingController();
  int index = 0;
  int index1 = 0;
  int index2 = 0;

  @override
  void initState() {
    super.initState();

    cardId.text = "SCAN CARD";
  }

  @override
  Widget build(BuildContext context) {
    var patientsProvider =
        Provider.of<PatientsProvider>(context, listen: false);
    var patientset = PatientHttp();
    var nursesProvider = Provider.of<NursesProvider>(context, listen: false);
    var doctorsProvider = Provider.of<DoctorsProvider>(context, listen: false);
    var wards = Provider.of<WardProvider>(context, listen: false);
    var conn = Provider.of<ConnectivityProvider>(context, listen: false);
    conn.start(context);
    var size = MediaQuery.of(context).size;
    bool yes = doctorsProvider.doctors.users?.isNotEmpty ?? false;
    bool yes1 = nursesProvider.nurses.users?.isNotEmpty ?? false;
    bool yes2 = wards.wards.wards.isNotEmpty;
    doctorSelectedOption.text =
        yes ? doctorsProvider.doctors.users![index1].email ?? "" : "";
    wardSelectedOption.text = yes2 ? wards.wards.wards[index2].id ?? "" : "";
    nurseSelectedOption.text =
        yes1 ? nursesProvider.nurses.users![index].email ?? "" : "";
    nurseId.text = yes1 ? nursesProvider.nurses.users![index].id ?? "" : "";
    doctorId.text = yes ? doctorsProvider.doctors.users![index1].id ?? "" : "";

    void changeDropDown(String value) {
      setState(() {
        var ue = nursesProvider.nurses.users!
            .indexWhere((element) => element.email == value);
        index = ue;
        nurseSelectedOption.text = value;
      });
    }

    void changeDropDown2(String value) {
      setState(() {
        var ue = doctorsProvider.doctors.users!
            .indexWhere((element) => element.email == value);
        index1 = ue;
        doctorSelectedOption.text = value;
      });
    }

    void changeDropDown3(String value) {
      setState(() {
        var ue = wards.wards.wards.indexWhere((element) => element.id == value);
        index2 = ue;
        wardSelectedOption.text = value;
      });
    }

    var space = SizedBox(
      height: size.height * 0.03,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).orientation == Orientation.landscape
              ? size.height * 1.6
              : size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/doctor_consultation_03.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            ),
            color: Colors.white,
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(20),
            // width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "ADMIT PATIENT",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  getTextForm(firstName, "Patient First Name"),
                  space,
                  getTextForm(secondName, "Second Name"),
                  space,
                  getNumberForm(age, "Age"),
                  space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "SELECT DOCTOR",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.blue,
                        ),
                      ),
                      getDropDownUsers(
                          doctorsProvider.doctors.users ?? List.empty(),
                          doctorSelectedOption,
                          changeDropDown2),
                    ],
                  ),
                  space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "SELECT NURSE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.blue,
                        ),
                      ),
                      getDropDownUsers(
                          nursesProvider.nurses.users ?? List.empty(),
                          nurseSelectedOption,
                          changeDropDown),
                    ],
                  ),
                  space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "SELECT WARD",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.blue,
                        ),
                      ),
                      getDropDownWards(wards.wards.wards, wardSelectedOption,
                          changeDropDown3),
                    ],
                  ),
                  space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cardId.text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.blue,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            op = 0.4;
                          });
                          var res = await StartNFCReading();
                          setState(() {
                            op = 0.1;
                            cardId.text = res;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape:const CircleBorder(),
                        ),
                        child: CircleAvatar(
                          foregroundColor: Colors.red,
                          backgroundImage:const AssetImage("assets/35891.jpg"),
                          radius: size.width * 0.1,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(op),
                                shape: BoxShape.circle),
                          ),
                        ),
                      )
                    ],
                  ),
                  space,
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate() &&
                          conn.status == ConnectivityStatus.online) {
                        var patient = Patient(
                          firstName: firstName.text,
                          secondName: secondName.text,
                          age: age.text,
                          carId: cardId.text,
                          nurseId: nurseId.text,
                          doctorId: doctorId.text,
                        );
                        bool res = false;
                        if (cardId.text != "SCAN CARD" &&
                            cardId.text != "Error") {
                          var patResp =
                              patientsProvider.getPatientWithId(cardId.text);
                          if (patResp != null && patResp.carId != null) {
                            showCustomSnackBar(context, "Card Used");
                          } else {
                            showLoadingDialog(context);
                            res = await patientset.createPatient(patient);

                            Navigator.of(context).pop();
                          }
                        } else if (cardId.text == "SCAN CARD" ||
                            cardId.text == "No Card") {
                          showCustomSnackBar(context, "Scan Card First");
                        } else {}

                        if (res) {
                          patientsProvider.patients.patients?.add(patient);
                          showCustomSnackBar(context, "Patient admitted");
                          Navigator.of(context).pop();
                        } else {
                          showCustomSnackBar(
                              context, "Failed to admit patient");
                        }
                      } else if (conn.status == ConnectivityStatus.offline) {
                        conn.showNetStatus();
                      }
                    },
                    child: const Text(
                      "ADMIT",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
