import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserAPI{
  static const String resourceUser = 'http://192.168.0.107:8080/api/v1/users';

  Future<int> createUser(User user) async{
    final uri = Uri.parse(resourceUser);
    Map<String, String> userHeader = {"Content-type": "application/json", "Accept": "application/json"};
    final userJson = jsonEncode(user.toJson());
    final response = await http.post(uri,body: userJson, headers: userHeader);
    print(response.headers['location']);
    print(response.statusCode);
    print(response.body);
    return response.statusCode;
  }

  getUser(String location) async {

  }

}