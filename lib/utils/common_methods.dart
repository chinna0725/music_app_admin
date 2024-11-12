import 'package:flutter/material.dart';

class CommonMethods {
  static showAlertDialog(BuildContext context, VoidCallback ftn) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      onPressed: ftn,
      child: const Text("Delete"),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Alert"),
      content: const Text("Would you like to Delete?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showErrorAlertDialog(BuildContext context, String error) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("ok"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Error"),
      content: Text(error),
      actions: [
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
