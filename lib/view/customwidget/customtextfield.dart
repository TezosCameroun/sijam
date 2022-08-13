// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LogingTextField extends Column {
  static Widget logingField({IconData? icon, String? hintText}) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Icon(icon),
          ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 300, height: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: hintText, border: InputBorder.none),
              ))
        ]),

        // width: 200,
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Divider(
            color: Colors.white,
            height: 2,
          ),
        ),
      ],
    );
  }
}
