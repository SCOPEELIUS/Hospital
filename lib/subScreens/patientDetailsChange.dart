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
import 'package:provider/provider.dart';

class PatientChaneDetails extends StatefulWidget {
  const PatientChaneDetails({super.key});

  @override
  State<PatientChaneDetails> createState() => _PatientChaneDetailsState();
}

class _PatientChaneDetailsState extends State<PatientChaneDetails> {
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
  int index = 0;
  int index1 = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var patientProvider = Provider.of<PatientProvider>(context, listen: false);
    var nursesProvider = Provider.of<NursesProvider>(context, listen: false);
    var doctorsProvider = Provider.of<DoctorsProvider>(context, listen: false);
    var patient = patientProvider.patient;
    cardId.text = patient.carId ?? "SCAN CARD";
    firstName.text = patient.firstName ?? "";
    secondName.text = patient.secondName ?? "";
    age.text = patient.age ?? "";
    nurseId.text = patient.nurseId ?? "";
    doctorId.text = patient.doctorId ?? "";
    index1 = doctorsProvider.doctors.users != null
        ? doctorsProvider.doctors.users!
            .indexWhere((element) => element.id == doctorId.text)
        : 0;
    index = nursesProvider.nurses.users != null
        ? nursesProvider.nurses.users!
            .indexWhere((element) => element.email == nurseId.text)
        : 0;

    if (index == -1) {
      index = 0;
    }

    if (index1 == -1) {
      index1 = 0;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var patientsProvider =
        Provider.of<PatientsProvider>(context, listen: false);
    var patientProvider = Provider.of<PatientProvider>(context, listen: false);
    var nursesProvider = Provider.of<NursesProvider>(context, listen: false);
    var doctorsProvider = Provider.of<DoctorsProvider>(context, listen: false);
    var conn = Provider.of<ConnectivityProvider>(context, listen: false);
    conn.start(context);
    var size = MediaQuery.of(context).size;

    doctorSelectedOption.text =
        doctorsProvider.doctors.users![index1].email ?? "";
    nurseSelectedOption.text = nursesProvider.nurses.users![index].email ?? "";
    nurseId.text = nursesProvider.nurses.users?[index].id ?? "";
    doctorId.text = doctorsProvider.doctors.users?[index1].id ?? "";

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
                        "CHANGE DOCTOR",
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
                        "CHANGE NURSE",
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
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate() &&
                          conn.status == ConnectivityStatus.online) {
                        var patient = Patient(
                          firstName: firstName.text,
                          secondName: secondName.text,
                          age: age.text,
                          carId: cardId.text,
                          nurseId: nurseSelectedOption.text,
                          doctorId: doctorSelectedOption.text,
                        );
                        showLoadingDialog(context);
                        patientProvider.setPatient(patient);

                        bool res = await patientProvider.updatePatient();
                        Navigator.of(context).pop();
                        if (res) {
                          patientsProvider.updatePatient(patient);
                          showCustomSnackBar(context, "Patient updated");
                        } else {
                          showCustomSnackBar(
                              context, "Failed to update Patient");
                        }
                        Navigator.of(context).pop();
                      } else {
                        conn.showNetStatus();
                      }
                    },
                    child: const Text(
                      "UPDATE",
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
