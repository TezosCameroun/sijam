import 'dart:io';
import 'dart:ui';

import 'package:dashed_rect/dashed_rect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijam/component/loading.dart';
import 'package:sijam/routs/routs.dart';
import 'package:sijam/view/customwidget/circularcheckbox.dart';
import 'package:sijam/view/customwidget/buttons/customButton.dart';
import 'package:sijam/view/kyc/helper/camera.dart';
import 'package:sijam/view/kyc/helper/imagehelper.dart';
import 'package:path/path.dart' as pp;

class Verify extends StatefulWidget {
  Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  bool isChecked = false;
  bool isId = false;
  bool isDriverLicense = false;
  bool isPassport = false;
  String doccumentType = '';
  Map<int, File> submittedImages = {};
  List documentTypes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                              child: const Icon(Icons.arrow_back_ios)),
                          const Text(
                            "Back",
                          ),
                        ],
                      ),
                      const Text(
                        "SIJAM",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  const Text("EN"),
                ],
              ),
            ),
            const Spacer(),
            const Text("Proof of identity",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "In order to complete your registration, please upload copy of your identity with a clear selfie photo to proof the document holder",
              softWrap: true,
              overflow: TextOverflow.clip,
              maxLines: 3,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Choose your identiy type",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChecked = true;
                      isId = true;
                      isDriverLicense = false;
                      isPassport = false;
                      isPassport = false;
                      doccumentType = "D card";
                    });
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CircukarCheckBox(
                          isChecked: isId,
                        ),
                      ),
                      const Text("ID card")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChecked = true;
                      isId = false;
                      isDriverLicense = false;
                      isPassport = true;
                      doccumentType = "passport";
                    });
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CircukarCheckBox(
                          isChecked: isPassport,
                        ),
                      ),
                      const Text("Passport")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isId = false;
                      isDriverLicense = true;
                      isPassport = false;
                      doccumentType = 'Driver license';
                    });
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CircukarCheckBox(
                          isChecked: isDriverLicense,
                        ),
                      ),
                      const Text("Driving license")
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () async {
                  // put camera picker
                  File? pickedImage;

                  final result = await showEjaraBottomSheet(
                      context: (context),
                      builder: (context) {
                        return const VerificationBottomSheet();
                      });

                  if (result == null) return;
                  pickedImage = await pickImages(result, context);
                },
                child: Container(
                  color: Colors.black12,
                  child: const DashedRect(
                      color: Colors.red,
                      strokeWidth: 2.0,
                      gap: 3.0,
                      child: ListTile(
                        title: Text("Upload Proof of Idnetity"),
                        subtitle:
                            Text("Id card or Driving license or Passport"),
                        trailing: Icon(Icons.upload_file),
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // ignore: prefer_const_constructors
            Text(
              "A selfie with your identity",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Please,make sure thatevery detailof the ID doccumentis clearly visible",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 7,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  //camer picker selfie
                  File? pickedImage;

                  final result = await showEjaraBottomSheet(
                      context: (context),
                      builder: (context) {
                        return const VerificationBottomSheet();
                      });

                  if (result == null) return;
                  pickedImage = await pickImages(result, context);
                  if (pickedImage != null) {
                    var imageExtension = pp.extension(pickedImage.path);
                    if (isImage(pickedImage.path) && imageExtension == '.jpg' ||
                        imageExtension == '.jpeg') {
                      // submittedImages.addAll({
                      //   documentTypes[index].id as int:
                      //       pickedImage
                      // });
                      // setState(() {
                      //   chosenPics
                      //       .add(documentTypes[index].id!);
                      // });
                    } else {
                      // showToastMessage(
                      //   AppLocalizations.of(context)
                      //       .translate('file_not_supported'),
                      // );
                      pickedImage.delete();
                    }
                  }
                },
                child: Container(
                  color: Colors.black12,
                  child: const DashedRect(
                      color: Colors.red,
                      strokeWidth: 2.0,
                      gap: 3.0,
                      child: ListTile(
                        title: Text("Take selfie with identity"),
                        subtitle: Text(
                            "Please note that screenshots, mobile phone bills, and issurance are NOT acceptable for verification"),
                        trailing: Icon(Icons.upload_file),
                      )),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: Container(
                width: 200,
                child: CustomButtons.elevatedBuntton(
                  backGroundcolor: const Color(0xff00008B),
                  onpress: (() {
                    Get.toNamed(RoutesClass.home);
                    loading(
                      context,
                    );
                  }),
                  text: const Text(
                    "NEXT",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

Future showEjaraBottomSheet({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  double radius = 12,
  bool barrierDismissable = true,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    isDismissible: barrierDismissable,
    context: context,
    builder: builder,
    routeSettings: RouteSettings(name: 'AchieveBottomSheetRoute'),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
    ),
  );
}
