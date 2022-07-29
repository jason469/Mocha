import 'package:flutter/cupertino.dart';
import 'package:mocha/constants/error_handling.dart';
import 'package:mocha/constants/global_variables.dart';
import 'package:mocha/constants/utils.dart';
import 'package:mocha/models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      print(email);
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
}
