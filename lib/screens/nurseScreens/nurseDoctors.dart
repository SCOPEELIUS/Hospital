import 'package:flutter/material.dart';
import 'package:hospital/models/accountTypes.dart';
import 'package:hospital/provider/usersProvider.dart';
import 'package:provider/provider.dart';

class NurseDoctors extends StatefulWidget {
  const NurseDoctors({super.key});

  @override
  State<NurseDoctors> createState() => _NurseDoctorsState();
}

class _NurseDoctorsState extends State<NurseDoctors> {
  @override
  Widget build(BuildContext context) {
    var usersProvider = Provider.of<UsersProvider>(context, listen: false);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white.withAlpha(110),
        elevation: 10,
        shadowColor: Colors.black,
        title: Text(
          "AVAILABLE DOCTORS",
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
          itemCount: usersProvider.users.users?.length,
          itemBuilder: (context, value) => (usersProvider
                          .users.users?[value].accountType ==
                      AccountType.doctor) ||
                  (usersProvider.users.users?[value].accountType == "Doctor")
              ? Container(
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
                      usersProvider.users.users?[value].firstName ?? "",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      usersProvider.users.users?[value].speciality ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/0684456b-aa2b-4631-86f7-93ceaf33303c.jpg"),
                    ),
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}
