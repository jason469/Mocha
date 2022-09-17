import 'package:mocha/constants/utils.dart';
import 'package:flutter/material.dart';

import 'package:mocha/features/auth/screens/auth_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', "");
      Navigator.of(context, rootNavigator: true).pushReplacement(
          MaterialPageRoute(builder: (context) => new AuthScreen()));
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
