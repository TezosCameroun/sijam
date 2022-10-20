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

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // const SignUp({Key? key}) : super(key: key);
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

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white54,
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 16, bottom: 10),
        child: SingleChildScrollView(
          child: Container(
            height: 800,
            color: Colors.transparent,
            child: Form(
              key: _fbKey,
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
                          Text("Login")
                        ]),
                  ),
                  Spacer(),
                  CustomFormField(
                    textEditingController: firstNameContoller,
                    textInputType: TextInputType.text,
                    hintText: "First Name",
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Field is required";
                      }
                    },
                  ),
                  Spacer(),
                  CustomFormField(
                    textEditingController: secondNameController,
                    textInputType: TextInputType.text,
                    hintText: "Last Name",
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Field is required";
                      }
                    },
                  ),
                  Spacer(),
                  CustomFormField(
                    textEditingController: phoneNumeberController,
                    textInputType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    hintText: "Phone Number",
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Field is required";
                      } else if (val.length < 9) {
                        return "Enter valid Phone Number";
                      }
                    },
                  ),
                  Spacer(),
                  CustomFormField(
                    textEditingController: userTypeController,
                    textInputType: TextInputType.text,
                    hintText: "User Type",
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Field is required";
                      }
                    },
                  ),
                  Spacer(),
                  CustomFormField(
                    textEditingController: emailContoller,
                    textInputType: TextInputType.name,
                    hintText: "Email",
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
                    textEditingController: cityController,
                    textInputType: TextInputType.name,
                    hintText: "City",
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Field is required";
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
                  CustomFormField(
                    textEditingController: confirmPaswordcontroller,
                    textInputType: TextInputType.none,
                    hintText: "Confirm Password",
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Field is required";
                      }
                      if (passwordContreoller.text.trim() !=
                          confirmPaswordcontroller.text.trim()) {
                        return "Password do not match";
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

                          dynamic response = await SijamAuth.cretaAccount(
                              firstName: firstNameContoller.text,
                              lastname: secondNameController.text,
                              email: emailContoller.text,
                              phonenumber: phoneNumeberController.text,
                              password: passwordContreoller.text,
                              userType: userTypeController.text,
                              city: cityController.text);

                          Navigator.pop(context);
                          if (response["status"]) {
                            print({"${response["status"]} status gold"});
                            Get.toNamed(RoutesClass.verifyid);
                          } else {
                            showAlertDialog(context, response["message"]);
                          }
                        }),
                        text: Text(
                          "SignUp",
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
