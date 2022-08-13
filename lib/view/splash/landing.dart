// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

          // ignore: prefer_const_constructors
          Stack(
        children: <Widget>[
          Container(
            // height: double.infinity,
            // width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'assets/images/milad-fakurian-PGdW_bHDbpI-unsplash.jpg',
              ),
              fit: BoxFit.fitHeight,
            )),
          ),
          Center(
              child: RichText(
            text: TextSpan(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  TextSpan(text: "WELCOME TO", style: TextStyle(fontSize: 10)),
                  TextSpan(text: "", style: TextStyle(fontSize: 25)),
                  TextSpan(text: "SIJAM", style: TextStyle(fontSize: 70))
                ]),
          )),
        ],
      ),
    );
  }
}
