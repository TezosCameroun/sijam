// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijam/view/customwidget/buttons/customSijambutton.dart';
import 'package:sijam/routs/routs.dart';

class StartScreen extends GetView {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: prefer_const_literals_to_create_immutables
        body: Stack(children: [
      // Image.asset(
      //   'assets/images/house.jpeg',
      // )

      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/sijambgimage.png'),
              fit: BoxFit.fill),
        ),
      ),
      // SingleChildScrollView(

      // )

      Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset('assets/images/sijamlogo.png'),
            Text(
              "Bienvenue sur Sijam",
              style: TextStyle(
                  color: Color(
                    0xffFFFFFF,
                  ),
                  fontWeight: FontWeight.w700,
                  fontSize: 28),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Achetez, louez des terrains titrés au cameroun\npar le biais de notre platforme, rapide et sécurisée.",
                softWrap: true,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(
                      0xffFFFFFF,
                    ).withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              ),
            ),
            Spacer(),
            CustomSijamButton(
              onclick: () {
                Get.toNamed(RoutesClass.getToLogin());
                // NewLogin
              },
              buttonText: "Connexion",
              buttonColor: Color(0xff013763),
              textColor: Color(0xffF2F4F7),
            ),
            SizedBox(
              height: 16,
            ),
            CustomSijamButton(
              buttonText: "S’inscrire",
              buttonColor: Color(0xffF2F4F7),
              textColor: Color(0xff7896B9),
              onclick: () {},
            )
          ],
        ),
      )
    ]));
  }
}
