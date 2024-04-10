import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserService{
  static const String resourceUser = 'http://192.168.0.107:8080/api/v1/users';

  createUser(User user) async{
    final uri = Uri.parse(resourceUser);
    Map<String, String> userHeader = {"Content-type": "application/json", "Accept": "application/json"};
    final userJson = jsonEncode(user.toJson());
    final response = await http.post(uri,body: userJson, headers: userHeader);
    print(response.body);
  }

}