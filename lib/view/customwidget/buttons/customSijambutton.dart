import 'package:flutter/material.dart';

class CustomSijamButton extends StatelessWidget {
  CustomSijamButton(
      {Key? key,
      this.buttonColor,
      required this.buttonText,
      this.width,
      this.height,
      this.textColor,
      this.onclick})
      : super(key: key);
  Color? buttonColor;
  Color? textColor;
  String? buttonText;
  double? width;
  double? height;
  VoidCallback? onclick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 48,
      child: ElevatedButton(
        onPressed: onclick,
        style: ElevatedButton.styleFrom(
          primary: buttonColor ?? Colors.cyan,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          "$buttonText",
          style: TextStyle(color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}
