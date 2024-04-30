import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevents closing the dialog by tapping outside
    builder: (BuildContext context) {
      return const Dialog(
        child: SizedBox(
          width: 100.0,
          height: 100.0,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 4.0, // Adjust the thickness of the indicator
              valueColor:
                  AlwaysStoppedAnimation<Color>(Colors.blue), // Custom color
            ),
          ),
        ),
      );
    },
  );
}

void showCustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 4, // Adjust the elevation for the shadow effect
      behavior: SnackBarBehavior.floating, // Floating style for the snackbar
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(8.0), // Adjust the border radius as needed
        side: BorderSide(
          color: Colors.grey.shade300, // Border color
          width: 1.0, // Border width
        ),
      ),
    ),
  );
}
