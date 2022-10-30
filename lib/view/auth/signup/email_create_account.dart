import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijam/api/auth.dart';
import 'package:sijam/component/loading.dart';
import 'package:sijam/helpers/formatters.dart';
import 'package:sijam/routs/routs.dart';
import 'package:sijam/view/customwidget/buttons/customSijambutton.dart';
import 'package:sijam/view/customwidget/textformfield/customtextfield.dart';

class EmailCreateAccount extends StatefulWidget {
  EmailCreateAccount({Key? key}) : super(key: key);

  @override
  State<EmailCreateAccount> createState() => _EmailCreateAccountState();
}

class _EmailCreateAccountState extends State<EmailCreateAccount> {
  bool isVissible = false;
  dynamic argumentData = Get.arguments;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();

  final _fbKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("getting areguements ${Get.arguments[0]} ");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 40),
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
                "Quelle adresse Email souhaitez-vous utiliser?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(
                    0xff00223E,
                  ),
                ),
              ),
              Text(
                "Nous vous enverons un code de confirmation a cette adresse Email.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff00223E).withOpacity(0.7)),
              ),
              const Padding(
                  padding: EdgeInsets.only(
                top: 36,
              )),
              Expanded(
                  child: Column(
                children: [
                  CustomFormField(
                      hintText: "Sijam@gmail.cm",
                      textInputType: TextInputType.emailAddress,
                      textEditingController: emailController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Field is required";
                        }
                        if (val.isValidEmail == false) {
                          print("validdddddddd  ${val.isValidEmail}");
                          return "Enter valid E-mail";
                        }
                      }),
                  const Padding(padding: EdgeInsets.only(top: 16)),
                  CustomFormField(
                    hintText: "Account Type",
                    textEditingController: accountTypeController,
                    textInputType: TextInputType.datetime,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Field is required";
                      }
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 16)),
                  CustomFormField(
                    hintText: "Password",
                    textInputType: TextInputType.none,
                    textEditingController: passwordController,
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
                    obscureText: isVissible,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Field is required";
                      }
                      if (isPasswordValid(passwordController.text) == false) {
                        return 'Enter valid password example "john123#"';
                      }
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 16)),
                  CustomFormField(
                    hintText: "Confirm Password",
                    textEditingController: confirmPasswordController,
                    textInputType: TextInputType.datetime,
                    obscureText: true,
                    // suffixIcon: IconButton(
                    //   onPressed: () {
                    //     setState(() {
                    //       isVissible = !isVissible;
                    //     });
                    //   },
                    //   icon: Icon(
                    //       isVissible ? Icons.visibility : Icons.visibility_off),
                    //   color: Color(0xff1B4467).withOpacity(0.7),
                    // ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Field is required";
                      }
                      if (passwordController.text !=
                          confirmPasswordController.text) {
                        return 'password must be idnetical ${passwordController.text}';
                      }
                    },
                  ),
                  // const SizedBox(
                  //   height: 58,
                  // ),
                  const Spacer(),
                  CustomSijamButton(
                    onclick: () async {
                      if (!_fbKey.currentState!.validate()) return;
                      _fbKey.currentState!.save();
                      // Get.toNamed(RoutesClass.getconfirmEmailSignUp());
                      loading(
                        context,
                      );
                      dynamic response = await SijamAuth.cretaAccount(
                          firstName: argumentData[0]["firstName"],
                          lastname: argumentData[0]["secondName"],
                          email: emailController.text,
                          phonenumber: argumentData[0]["phoneNumber"],
                          password: passwordController.text,
                          userType: argumentData[0]["city"],
                          city: accountTypeController.text);
                      Navigator.pop(context);
                      if (response["status"]) {
                        print({"${response["status"]} status gold"});
                        Get.toNamed(RoutesClass.verifyid);
                      } else {
                        showAlertDialog(context, response["message"]);
                      }
                    },
                    buttonText: "Continuer",
                    buttonColor: Color(0xff013763),
                    textColor: Color(0xffF2F4F7),
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
