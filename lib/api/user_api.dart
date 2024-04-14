import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserAPI{
  static const String resourceUser = 'http://192.168.0.107:8080/api/v1/users';
  static const Map<String, String> header = {"Content-type": "application/json", "Accept": "application/json"};

  Future<int> createUser(User user) async{
    final uri = Uri.parse(resourceUser);
    final userJson = jsonEncode(user.toJson());
    final response = await http.post(uri,body: userJson, headers: header);
    print(response.headers['location']);
    print(response.statusCode);
    print(response.body);
    return response.statusCode;
  }

}