import 'dart:convert';

import 'package:sijam/services/sijam_service.dart';
import 'package:http/http.dart' as http;

SijamServiceAuth sj = SijamServiceAuth();
late http.Response response;
bool? status;
String message = "";

class SijamAuth {
  static Future cretaAccount(
      {firstName,
      lastname,
      email,
      phonenumber,
      password,
      userType,
      city}) async {
    Map body = {
      "firstName": firstName,
      "lastName": lastname,
      "email": email,
      "phoneNumber": phonenumber,
      "password": password,
      "typeUser": userType,
      "city": city
    };

    response = await sj.post("user/", body: body);
    Map decodedResponse = jsonDecode(response.body);
    message = decodedResponse["message"];
    print("${message} blalalala");
    if (decodedResponse['code'] == 200) {
      status = true;
    } else {
      status = false;
    }

    return {"status": status, "message": message};
  }

  static Future login({email, password}) async {
    Map body = {
      "login": email,
      "password": password,
    };

    response = await sj.post("user/sigin", body: body);
    Map decodedResponse = jsonDecode(response.body);
    message = decodedResponse["message"];
    print("${message} login");

    if (decodedResponse['code'] == 200) {
      status = true;
    } else {
      status = false;
    }

    return {"status": status, "message": message};
  }
}
