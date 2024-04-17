import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital/subScreens/patientDetails.dart';

class ReceptionPatients extends StatefulWidget {
  const ReceptionPatients({super.key});

  @override
  State<ReceptionPatients> createState() => _ReceptionPatientsState();
}

class _ReceptionPatientsState extends State<ReceptionPatients> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white.withAlpha(110),
        elevation: 10,
        shadowColor: Colors.black,
        title: Text(
          "ALL PATIENTS",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.blue.shade800),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/3763028.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
          ),
        ),
        height: size.height,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, value) => Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(-2, -2),
                    spreadRadius: -2,
                    blurRadius: 3,
                    color: Colors.black,
                    blurStyle: BlurStyle.solid),
                BoxShadow(
                    offset: Offset(2, 2),
                    spreadRadius: -2,
                    blurRadius: 3,
                    color: Colors.black,
                    blurStyle: BlurStyle.solid),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/0684456b-aa2b-4631-86f7-93ceaf33303c.jpg"),
                    ),
                    SizedBox(
                      width: size.height * 0.01,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Patient Name",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text("0746709189",
                            style: TextStyle(
                              fontSize: 18,
                            ))
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Patient()));
                      },
                      child: const Text(
                        "View",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Re-assign Doctor",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Reliese",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
