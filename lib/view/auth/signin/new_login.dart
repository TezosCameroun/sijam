import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijam/api/auth.dart';
import 'package:sijam/component/loading.dart';
import 'package:sijam/helpers/formatters.dart';
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
  final _fbKey = GlobalKey<FormState>();
  TextEditingController emailContoller = TextEditingController();
  TextEditingController passwordContreoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: Form(
          key: _fbKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    textEditingController: emailContoller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Field is required";
                      }
                      if (checkEmail(val) == false) {
                        return "enter valid email";
                      }
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 16)),
                  CustomFormField(
                    hintText: "Mot de passe",
                    textInputType: TextInputType.datetime,
                    textEditingController: passwordContreoller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Field is required";
                      }
                      if (isPasswordValid(passwordContreoller.text) == false) {
                        return "enter valid valid password";
                      }
                    },
                    obscureText: isVissible,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVissible = !isVissible;
                        });
                      },
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
                  CustomSijamButton(
                    onclick: () async {
                      if (!_fbKey.currentState!.validate()) return;
                      _fbKey.currentState!.save();

                      loading(
                        context,
                      );

                      dynamic response = await SijamAuth.login(
                        email: emailContoller.text,
                        password: passwordContreoller.text,
                      );
                      Navigator.pop(context);
                      if (response["status"]) {
                        print({"${response["status"]} status gold"});
                        Get.toNamed(RoutesClass.verifyid);
                      } else {
                        showAlertDialog(context, response["message"]);
                      }
                    },
                    buttonText: "Connexion",
                    buttonColor: Color(0xffF2F4F7),
                    textColor: Color(0xff7896B9),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
