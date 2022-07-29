import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mocha/constants/error_handling.dart';
import 'package:mocha/constants/global_variables.dart';
import 'package:mocha/constants/utils.dart';
import 'package:mocha/features/home/screens/home_screen.dart';
import 'package:mocha/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:mocha/providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');

      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            "Account Created successfully! Log in with the same credentials",
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
