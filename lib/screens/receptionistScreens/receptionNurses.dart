import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital/models/accountTypes.dart';
import 'package:hospital/provider/nursesProvider.dart';
import 'package:provider/provider.dart';

class ReceptionNurses extends StatefulWidget {
  const ReceptionNurses({super.key});

  @override
  State<ReceptionNurses> createState() => _ReceptionNursesState();
}

class _ReceptionNursesState extends State<ReceptionNurses> {
  @override
  Widget build(BuildContext context) {
    var usersProvider = Provider.of<NursesProvider>(context, listen: true);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white.withAlpha(110),
        elevation: 10,
        shadowColor: Colors.black,
        title: Text(
          "AVAILABLE NURSES",
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
          itemCount: usersProvider.nurses.users == null
              ? 0
              : usersProvider.nurses.users!.length,
          itemBuilder: (context, value) => Container(
            margin: const EdgeInsets.all(20),
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
            child: ListTile(
              title: Text(
                usersProvider.nurses.users?[value].firstName ?? "",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                usersProvider.nurses.users?[value].speciality ?? "",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: const CircleAvatar(
                backgroundImage: AssetImage(
                    "assets/0684456b-aa2b-4631-86f7-93ceaf33303c.jpg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
