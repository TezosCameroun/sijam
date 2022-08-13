// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sijam/routs/routs.dart';
import 'package:sijam/view/customwidget/customButton.dart';
import 'package:sijam/view/customwidget/customtextfield.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                // ignore: unnecessary_const
                image: const DecorationImage(
              image: AssetImage(
                'assets/images/house.jpeg',
              ),
              fit: BoxFit.fitHeight,
            )),
          ),
          Center(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color(0xff00008B).withOpacity(0.9),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Container(
              // height: 20,
              width: double.infinity,
              child: Column(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.arrow_back_ios)),
                          Text("Sign Up")
                        ]),
                  ),
                  Spacer(),
                  LogingTextField.logingField(
                      icon: Icons.person, hintText: "FIRST NAME"),
                  Spacer(),
                  LogingTextField.logingField(
                      icon: Icons.person, hintText: "LAST NAME"),
                  Spacer(),
                  LogingTextField.logingField(
                      icon: Icons.phone, hintText: "PHONE NUMBER"),
                  Spacer(),
                  LogingTextField.logingField(
                      icon: Icons.visibility, hintText: "PASSWORD"),
                  Spacer(),
                  LogingTextField.logingField(
                      icon: Icons.visibility_off_sharp,
                      hintText: "CONFIRM PASSWORD"),
                  Spacer(),
                  LogingTextField.logingField(
                      icon: Icons.verified_user, hintText: "CLIENT TYPE"),
                  Spacer(),
                  LogingTextField.logingField(
                      icon: Icons.flag, hintText: "COUNTRY"),
                  Spacer(),
                  CustomButtons.elevatedBuntton(
                      backGroundcolor: Color(0xff00008B),
                      onpress: (() {
                        Get.toNamed(RoutesClass.register);
                      }),
                      text: Text(
                        "LogIn",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
