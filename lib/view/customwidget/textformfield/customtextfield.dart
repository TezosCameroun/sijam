// ignore_for_file: prefer_const_constructors

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? textEditingController;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  CustomFormField(
      {Key? key,
      required this.hintText,
      this.inputFormatters,
      this.validator,
      this.textEditingController,
      this.suffixIcon,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      inputFormatters: inputFormatters,
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
              color: Color(0xff00223E).withOpacity(0.7), fontSize: 14),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Color(0xffC7D1DF), width: 1.0))),
    );
  }
}

extension extString on String {
  bool get isValidName {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidEmail {
    final nameRegExp = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!”#$%&’()*+,-./:;<=>?@[\]^_`{|}~])[A-Za-z\d!”#$%&’()*+,-./:;<=>?@[\]^_`{|}~]{8,}$');
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}

extension FancyNum on num {
  num plus(num other) => this + other;

  num times(num other) => this * other;
}

checkEmail(String email) {
  bool val = EmailValidator.validate(email.trim());
  print("nsdkdnls $val");
  return val;
}
