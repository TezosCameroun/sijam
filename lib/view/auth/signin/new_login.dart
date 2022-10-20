import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijam/routs/routs.dart';
import 'package:sijam/view/customwidget/buttons/customSijambutton.dart';
import 'package:sijam/view/customwidget/textformfield/customtextfield.dart';

class NewLogin extends StatefulWidget {
  NewLogin({Key? key}) : super(key: key);

  @override
  State<NewLogin> createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {
  bool isVissible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 100, 16, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Bienvenue!",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(
                    0xff00223E,
                  )),
            ),
            Text(
              "Veuillez vous connecter à votre compte.",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff00223E).withOpacity(0.7)),
            ),
            const Padding(padding: EdgeInsets.only(top: 36)),
            Expanded(
                child: Column(
              children: [
                CustomFormField(
                  hintText: "Email",
                  textInputType: TextInputType.datetime,
                ),
                const Padding(padding: EdgeInsets.only(top: 16)),
                CustomFormField(
                  hintText: "Mot de passe",
                  textInputType: TextInputType.datetime,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                        isVissible ? Icons.visibility : Icons.visibility_off),
                    color: Color(0xff1B4467).withOpacity(0.7),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 16)),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Mot de passe oubliez?",
                    style: TextStyle(color: Color(0xff266192)),
                  ),
                ),
                const SizedBox(
                  height: 58,
                ),
                // CustomSijamButton(
                //   buttonText: "Connexion",
                //   textColor: Color(0xff7896B9),
                //   buttonColor: Color.fromARGB(255, 5, 14, 27),
                // )
                CustomSijamButton(
                  onclick: () {},
                  buttonText: "Connexion",
                  buttonColor: Color(0xffF2F4F7),
                  textColor: Color(0xff7896B9),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
