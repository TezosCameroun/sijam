import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  String _firstName = "";
  String _lastName = "";
  String _password = "";
  String _city = "";
  String _phoneNumber = "";
  String _userType = "";

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get password => _password;
  String get city => _city;
  String get phoneNumber => _phoneNumber;
  String get userType => _userType;

  getUserInfo(
      {String? firstName,
      String? lastName,
      String? password,
      String? city,
      String? phoneNumber,
      String? userType}) {
    _city = city!;
    notifyListeners();

    _firstName = firstName!;
    notifyListeners();
    _lastName = lastName!;
    notifyListeners();
    _phoneNumber = phoneNumber!;
    notifyListeners();
    _password = password!;
    notifyListeners();

    _userType = userType!;
    notifyListeners();
  }
}
