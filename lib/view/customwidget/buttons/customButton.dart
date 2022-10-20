import 'package:flutter/material.dart';

class CustomButtons {
  static Widget elevatedBuntton({onpress, Text? text, Color? backGroundcolor}) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backGroundcolor!),
      ),
      onPressed: onpress,
      child: text,
    );
  }
}
