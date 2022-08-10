import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:mocha/constants/global_variables.dart';
import 'package:mocha/providers/user_provider.dart';


void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

Future<http.Response> httpGet(context, endpoint) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);

  http.Response res = await http.get(
    Uri.parse('$uri/api/$endpoint'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'x-auth-token': userProvider.user.token,
    },
  );
  return res;
}

Future<http.Response> httpPost(context, endpoint, body) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);

  http.Response res = await http.post(
    Uri.parse('$uri/api/$endpoint'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'x-auth-token': userProvider.user.token,
    },
    body: body
  );
  return res;
}

Future<http.Response> httpPatch(context, endpoint, id) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);

  http.Response res = await http.patch(
      Uri.parse('$uri/api/$endpoint/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      },
  );
  return res;
}

Future<http.Response> httpDelete(context, endpoint, id) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);

  http.Response res = await http.delete(
      Uri.parse('$uri/api/$endpoint/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      },
  );
  return res;
}
