import 'package:flutter/material.dart';
import 'package:hospital/components/buttons.dart';

class PatientAdmittion extends StatefulWidget {
  const PatientAdmittion({super.key});

  @override
  State<PatientAdmittion> createState() => _PatientAdmittionState();
}

class _PatientAdmittionState extends State<PatientAdmittion> {
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _bloodGroup = TextEditingController();
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white.withAlpha(110),
        elevation: 10,
        shadowColor: Colors.black,
        title: Text(
          "ENTER PATIENT DETAILS",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.blue.shade800),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    TextFormField(
                      cursorColor: Colors.blue,
                      controller: _nameController,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue.withGreen(100),
                      ),
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        labelText: 'Name',
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      validator: (value) {
                        RegExp emailRegex =
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        } else if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email';
                        } else {
                          return null;
                        }
                        // Add more email validation logic if needed
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    TextFormField(
                      cursorColor: Colors.blue,
                      controller: _contactController,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue.withGreen(100),
                      ),
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        labelText: 'Contacts',
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must have atleast six characters ';
                        } else {
                          return null;
                        }
                        // Add more email validation logic if needed
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    TextFormField(
                      cursorColor: Colors.blue,
                      controller: _bloodGroup,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue.withGreen(100),
                      ),
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        labelText: 'Blood Group',
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must have atleast six characters ';
                        } else {
                          return null;
                        }
                        // Add more email validation logic if needed
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Assign Doctor",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        getDropDown(doctorOptions, doctorSelectedOption.text,
                            changeDropDown2),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Assign Nurse",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        getDropDown(nurseOptions, nurseSelectedOption.text,
                            changeDropDown),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // if (formKey.currentState!.validate()) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(content: Text('Form submitted')),
                          //   );
                          //   if (text == "DOCTOR") {
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //         builder: (context) => const DoctorsMain()));
                          //   }
                          //   if (text == "NURSE") {
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //         builder: (context) => const NurseMain()));
                          //   }
                          //   if (text == "RECEPTIONIST") {
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //         builder: (context) => const ReceptionMain()));
                          //   }
                          // }
                        },
                        child: const Text(
                          "Admit",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
