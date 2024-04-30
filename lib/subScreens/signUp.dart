import 'package:flutter/material.dart';
import 'package:hospital/components/loginComponents.dart';
import 'package:hospital/provider/networkProvider.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _passWord = TextEditingController();
  final _firstName = TextEditingController();
  final _secondName = TextEditingController();
  final _profession = TextEditingController();
  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<String> options = ['Doctor', 'Nurse', 'Receptionist'];
  final selectedOption = TextEditingController();
  @override
  void initState() {
    super.initState();
    selectedOption.text = options[0];
  }

  void changeDropDown(String value) {
    setState(() {
      selectedOption.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
  
    var size = MediaQuery.of(context).size;
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
          child: getSignUp(
            context,
            _formKey,
            _firstName,
            _secondName,
            _profession,
            _email,
            _passWord,
            options,
            selectedOption,
            changeDropDown,
          ),
        ),
      ),
    );
  }
}
