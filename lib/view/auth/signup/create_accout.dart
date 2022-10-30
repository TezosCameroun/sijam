import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sijam/routs/routs.dart';
import 'package:sijam/view/customwidget/buttons/customSijambutton.dart';
import 'package:sijam/view/customwidget/textformfield/customtextfield.dart';

class SignUpCreateAccount extends StatefulWidget {
  SignUpCreateAccount({Key? key}) : super(key: key);

  @override
  State<SignUpCreateAccount> createState() => _SignUpCreateAccountState();
}

class _SignUpCreateAccountState extends State<SignUpCreateAccount> {
  bool isVissible = false;
  final _fbKey = GlobalKey<FormState>();
  TextEditingController _testEditingController = TextEditingController();

  TextEditingController passwordContreoller = TextEditingController();

  TextEditingController confirmPaswordcontroller = TextEditingController();

  TextEditingController phoneNumeberController = TextEditingController();

  TextEditingController firstNameContoller = TextEditingController();

  TextEditingController secondNameController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController userTypeController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailContoller = TextEditingController();
  TextEditingController genderController = TextEditingController();
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
                "Créer un compte",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(
                      0xff00223E,
                    )),
              ),
              Text(
                "Veuillez remplir le formulaire pour continuer.",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff00223E).withOpacity(0.7)),
              ),
              const Padding(
                  padding: EdgeInsets.only(
                top: 36,
              )),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomFormField(
                      hintText: "first name",
                      textInputType: TextInputType.datetime,
                      textEditingController: firstNameContoller,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Field is required";
                        }
                      },
                    ),
                    const Padding(padding: EdgeInsets.only(top: 16)),
                    CustomFormField(
                      hintText: "Second Name",
                      textInputType: TextInputType.datetime,
                      textEditingController: secondNameController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Field is required";
                        }
                      },
                    ),
                    const Padding(padding: EdgeInsets.only(top: 16)),
                    CustomFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Field is required";
                          }
                        },
                        textInputType: TextInputType.text,
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                        hintText: "Username",
                        textEditingController: usernameController),
                    const Padding(padding: EdgeInsets.only(top: 16)),
                    CustomFormField(
                      hintText: "Phone number",
                      textInputType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textEditingController: phoneNumeberController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Field is required";
                        } else if (val.length < 9) {
                          return "Enter valid Phone Number";
                        }
                      },
                    ),
                    const Padding(padding: EdgeInsets.only(top: 16)),
                    CustomFormField(
                      hintText: "Genre",
                      textInputType: TextInputType.datetime,
                      textEditingController: genderController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Field is required";
                        }
                      },
                    ),
                    const Padding(padding: EdgeInsets.only(top: 16)),
                    CustomFormField(
                      hintText: "ville",
                      textInputType: TextInputType.datetime,
                      textEditingController: cityController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Field is required";
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    CustomSijamButton(
                      onclick: () {
                        if (!_fbKey.currentState!.validate()) return;
                        _fbKey.currentState!.save();
                        Get.toNamed(RoutesClass.getemailcreateAccount(),
                            arguments: [
                              {
                                "firstName": firstNameContoller.text,
                                "secondName": secondNameController.text,
                                "city": cityController.text,
                                "gender": genderController.text,
                                "phoneNumber": phoneNumeberController.text,
                              },
                            ]);
                      },
                      buttonText: "Connexion",
                      buttonColor: Color(0xff013763),
                      textColor: Color(0xffF2F4F7),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
