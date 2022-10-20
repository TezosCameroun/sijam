import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijam/routs/routs.dart';
import 'package:sijam/view/controllers/controllers.dart';
import 'package:sijam/view/splash/startscreen.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      initialRoute: RoutesClass.launchone,
      getPages: RoutesClass.routes,
    ),
  );
}
