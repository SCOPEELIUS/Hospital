import 'package:flutter/material.dart';
import 'package:hospital/components/indicators.dart';
import 'package:hospital/components/textFormFields.dart';
import 'package:hospital/models/ward.dart';
import 'package:hospital/provider/networkProvider.dart';
import 'package:hospital/provider/wardsProvider.dart';
import 'package:provider/provider.dart';

void createWard(BuildContext context) {
  var size = MediaQuery.of(context).size;
  final _formKey = GlobalKey<FormState>();
  var conn = Provider.of<ConnectivityProvider>(context, listen: false);
  conn.start(context);
  var wards = Provider.of<WardProvider>(context, listen: false);
  TextEditingController wardName = TextEditingController();
  TextEditingController wardNumber = TextEditingController();
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: ((context) {
      return Dialog(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "CREATE NEW WARD",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.05),
                getTextForm(wardName, "Ward name"),
                SizedBox(height: size.height * 0.05),
                getNumberForm(wardNumber, "Ward number"),
                SizedBox(height: size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade300),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            conn.status == ConnectivityStatus.online) {
                          Ward ward = Ward(
                              wardName: wardName.text,
                              noOfbeds: wardNumber.text);
                          showLoadingDialog(context);
                          bool res = await wards.createWard(ward);
                          Navigator.of(context).pop();
                          if (res) {
                            showCustomSnackBar(context, "Ward Created");
                            Navigator.of(context).pop();
                          } else {
                            showCustomSnackBar(
                                context, "Failed to create ward");
                          }
                        } else if (conn.status == ConnectivityStatus.offline) {
                          conn.showNetStatus();
                        }
                      },
                      child: const Text(
                        "Create",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }),
  );
}
