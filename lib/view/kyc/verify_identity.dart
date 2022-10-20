// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijam/routs/routs.dart';
import 'package:sijam/view/customwidget/circularcheckbox.dart';
import 'package:sijam/view/customwidget/buttons/customButton.dart';

class VerifyIdentity extends StatelessWidget {
  const VerifyIdentity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Column(
                children: [
                  Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(Icons.arrow_back_ios)),
                                Text(
                                  "Back",
                                ),
                              ],
                            ),
                            Text(
                              "SIJAM",
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                        Text("EN"),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.verified_user,
                    size: 100,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Verify your Identity",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Identify your self with Sijam so as to get the best of our sevices.By verifying your account, you will be eligible to enjoy fulls access to our services. Sijam won't meke the public",
                maxLines: 5,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            Spacer(),
            Container(
              width: 200,
              child: CustomButtons.elevatedBuntton(
                backGroundcolor: Color(0xff00008B),
                onpress: (() {
                  Get.toNamed(RoutesClass.getKyc);
                }),
                text: Text(
                  "NEXT",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Spacer(),
            Text("skip"),
            Spacer(),
          ],
        ));
  }
}
