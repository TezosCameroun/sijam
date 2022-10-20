import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijam/routs/routs.dart';

class LaunchScreenone extends StatelessWidget {
  const LaunchScreenone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: const Color(0xffE5E5E5),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset('assets/images/sijamlogo.png'),
            const Text(
              "Sijam",
              style: TextStyle(
                color: Color(0xff013763),
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
                fontSize: 25,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: (() {
                Get.toNamed(RoutesClass.start);
              }),
              child: const Text(
                "Continue",
                style: TextStyle(
                    color: Color(0xff013763),
                    decoration: TextDecoration.none,
                    fontSize: 15),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
