import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

void loading(context, [message = '']) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor:
                message.trim().length == 0 ? Colors.transparent : Colors.white,
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Stack(children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: LoadingFlipping.circle(
                    borderColor: Colors.transparent,
                    borderSize: 3.0,
                    size: 48.0,
                    backgroundColor: Colors.green, //Color(0xFF4a5aed),
                    duration: Duration(milliseconds: 1200),
                  ),
                )
              ]),
              SizedBox(height: 5),
              Text(message),
              SizedBox(height: 5),
            ]));
      });
}

loader([s = 40.0, Color color = const Color(0xFF4a7bbd)]) {
  return LoadingBouncingGrid.circle(
    borderColor: Colors.transparent,
    borderSize: 3.0,
    size: s,
    backgroundColor: color,
    inverted: true,
    duration: Duration(milliseconds: 1200),
  );
}

showAlertDialog(BuildContext context, String message) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    alignment: Alignment.center,
    content: Text("$message"),
    actions: [
      okButton,
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
