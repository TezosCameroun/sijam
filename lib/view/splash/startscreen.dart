// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijam/routs/routs.dart';
import 'package:sijam/view/auth/signup/register.dart';
import 'package:sijam/view/controllers/controllers.dart';
import 'package:sijam/view/customwidget/customButton.dart';

class StartScreen extends GetView {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: double.infinity,
            width: double.infinity,
            child: Column(children: [
              Expanded(
                child: Container(
                  // ignore: sort_child_properties_last
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text("SIJAM",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 30,
                                color: Colors.white)),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("WELCOME TO SIJAM",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 18,
                                color: Color(0xffF5FFFA))),
                      ),
                      Text("BUY SECURED LANDS",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 12,
                              color: Color(0xffF5FFFA))),
                      Text("AT AFFORDABLE PRICES",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 12,
                              color: Color(0xffF5FFFA))),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("LEARN MORE",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                color: Color(0xffF5FFFA))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Divider(
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/house.jpeg',
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 130,
                        height: 30,
                        child: CustomButtons.elevatedBuntton(
                            backGroundcolor: Color(0xff00008B),
                            onpress: (() {
                              Get.toNamed(RoutesClass.login);
                            }),
                            text: Text(
                              "SIGN IN",
                              style: TextStyle(color: Colors.white),
                            ))),
                    SizedBox(
                        width: 130,
                        height: 30,
                        child: CustomButtons.elevatedBuntton(
                            backGroundcolor: Color(0xff00008B),
                            onpress: (() {
                              Get.toNamed(RoutesClass.register);
                            }),
                            text: Text(
                              "SIGN UP",
                              style: TextStyle(color: Colors.white),
                            ))),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
