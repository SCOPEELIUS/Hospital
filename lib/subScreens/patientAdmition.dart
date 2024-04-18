import 'package:flutter/material.dart';
import 'package:hospital/components/buttons.dart';
import 'package:hospital/components/textFormFields.dart';

class PatientAdmittion extends StatefulWidget {
  const PatientAdmittion({super.key});

  @override
  State<PatientAdmittion> createState() => _PatientAdmittionState();
}

class _PatientAdmittionState extends State<PatientAdmittion> {
  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final secondName = TextEditingController();

  final email = TextEditingController();
  final age = TextEditingController();
  final cardId = TextEditingController();
  final nurseId = TextEditingController();
  final doctorId = TextEditingController();
  List<String> doctorOptions = ['DOCTOR A', 'DOCTOR B', 'DOCTOR C'];
  final doctorSelectedOption = TextEditingController();
  List<String> nurseOptions = ['NURSE A', 'NURSE B', 'NURSE C'];
  final nurseSelectedOption = TextEditingController();
  @override
  void initState() {
    super.initState();
    doctorSelectedOption.text = doctorOptions[0];
    nurseSelectedOption.text = nurseOptions[0];
  }

  void changeDropDown(String value) {
    setState(() {
      nurseSelectedOption.text = value;
    });
  }

  void changeDropDown2(String value) {
    setState(() {
      doctorSelectedOption.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var space = SizedBox(
      height: size.height * 0.03,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).orientation == Orientation.landscape
              ? size.height * 1.3
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
            width: MediaQuery.of(context).size.width * 0.85,
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
                  getTextForm(age, "Age"),
                  space,
                  getEmailForm(email),
                  space,
                  getTextForm(doctorId, "Doctor Id"),
                  space,
                  getTextForm(nurseId, "Nurse Id"),
                  space,
                  ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {}
                      },
                      child: const Text(
                        "ADMIT",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
