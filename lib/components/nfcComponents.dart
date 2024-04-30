import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

Widget getNfcReader(
    BuildContext context, Size size, String text, void Function() callBack) {
  return Container(
    alignment: Alignment.bottomCenter,
    margin: const EdgeInsets.all(8),
    height: size.height * 0.25,
    width: size.width * 0.4,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: text == "SCAN CARD"
            ? const AssetImage("assets/7140420.jpg")
            : const AssetImage("assets/Loading-rafiki.png"),
        fit: BoxFit.cover,
        colorFilter: const ColorFilter.mode(Colors.black12, BlendMode.darken),
      ),
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
      boxShadow: const [
        BoxShadow(
            offset: Offset(-2, -2),
            spreadRadius: -2,
            blurRadius: 10,
            color: Colors.black,
            blurStyle: BlurStyle.solid),
        BoxShadow(
            offset: Offset(2, 2),
            spreadRadius: -2,
            blurRadius: 10,
            color: Colors.black,
            blurStyle: BlurStyle.solid),
      ],
    ),
    child: ElevatedButton(
        onPressed: () {
          callBack();
        },
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        )),
  );
}

void eraseCard() {
  //Erase from DB
}
Future<String> StartNFCReading() async {
  try {
    NFCTag tag = await FlutterNfcKit.poll(timeout: Duration(seconds: 2));
    // Update the UI with tag ID or other tag information
    print("The nfc tag is ${tag.id}");

    await FlutterNfcKit.finish();
    return tag.id;
  } catch (e) {
    print('Error reading NFC: $e');
    await FlutterNfcKit.finish();
    return "Error";
  }
}

Future<void> ShowNFCDialog(BuildContext context, String data) async {
  showDialog(
      context: context,
      builder: (context) => Dialog(
            elevation: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(-2, -2),
                      spreadRadius: -2,
                      blurRadius: 10,
                      color: Colors.black,
                      blurStyle: BlurStyle.solid),
                  BoxShadow(
                      offset: Offset(2, 2),
                      spreadRadius: -2,
                      blurRadius: 10,
                      color: Colors.black,
                      blurStyle: BlurStyle.solid),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 18),
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Close")),
                  ),
                ],
              ),
            ),
          ));
}
