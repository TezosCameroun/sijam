// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sijam/api/auth.dart';
import 'package:sijam/component/loading.dart';
import 'package:sijam/routs/routs.dart';
import 'package:sijam/view/customwidget/buttons/customButton.dart';
import 'package:sijam/view/customwidget/textformfield/customtextfield.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // const LogIn({Key? key}) : super(key: key);
  final _fbKey = GlobalKey<FormState>();

  TextEditingController _testEditingController = TextEditingController();

  TextEditingController passwordContreoller = TextEditingController();

  TextEditingController confirmPaswordcontroller = TextEditingController();

  TextEditingController phoneNumeberController = TextEditingController();

  TextEditingController firstNameContoller = TextEditingController();

  TextEditingController secondNameController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController userTypeController = TextEditingController();

  TextEditingController emailContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white54,
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 16, bottom: 10),
        child: Expanded(
          child: Container(
            color: Colors.transparent,
            child: Form(
              key: _fbKey,
              child: Column(
                children: [
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
                          Text("SignUp")
                        ]),
                  ),
                  Spacer(),
                  CustomFormField(
                    textEditingController: secondNameController,
                    textInputType: TextInputType.text,
                    hintText: "sijam@gmail.com",
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Field is required";
                      }
                      if (checkEmail(val) == false) {
                        return "enter valid email";
                      }
                    },
                  ),
                  Spacer(),
                  CustomFormField(
                    textEditingController: passwordContreoller,
                    textInputType: TextInputType.none,
                    hintText: "Password",
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Field is required";
                      }
                      if (val.isValidPassword) {
                        return "enter valid valid password";
                      }
                    },
                  ),
                  Spacer(),
                  Container(
                    child: CustomButtons.elevatedBuntton(
                        backGroundcolor: Color(0xff00008B),
                        onpress: (() async {
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
                        }),
                        text: Text(
                          "LogIn",
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
