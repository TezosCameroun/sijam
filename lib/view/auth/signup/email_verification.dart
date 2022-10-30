import 'package:flutter/material.dart';
import 'package:sijam/view/customwidget/buttons/customSijambutton.dart';
import 'package:get/get.dart';
import 'package:sijam/routs/routs.dart';

class ConfirmEmailSignUp extends StatelessWidget {
  const ConfirmEmailSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              // color: Colors.green,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                    // Color(0xffF2F4F7),
                    // Color(0xffC7D1DF),
                    Color(0xff7896B9),
                    Color(0xff266192),
                    Color(0xff1B4467),
                    Color(0xff013763),
                    Color(0xff003158),
                    Color(0xff002A4C),
                    Color(0xff00223E),
                    Color(0xff00182C),
                  ])),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 36, 16, 16),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (() {
                              Navigator.pop(context);
                            }),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xff1B4467),
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    const Text(
                      "Confirmez votre E-mail",
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Nous venons de vous envoyer un E-mail",
                      style: TextStyle(
                          color: Color(0xffFFFFFF).withOpacity(0.6),
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    CustomSijamButton(
                      onclick: () {
                        Get.toNamed(RoutesClass.getsuccessEmailSignUp());
                      },
                      buttonText: "Ouvrez votre boite E-mail",
                      buttonColor: Color(0xff73FBD3),
                      textColor: Color(0xff013763),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomSijamButton(
                      onclick: () {
                        Get.toNamed(RoutesClass.getconfirmEmailSignUp());
                      },
                      buttonText: "Je n’ai pas reçu d’ E-mail",
                      buttonColor: Color(0xff013763),
                      textColor: Color(0xffF2F4F7),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
