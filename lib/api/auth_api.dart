import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class AuthAPI {
  static final String resourceAuth = 'http://192.168.0.107:8080/api/v1/auth';
  static const Map<String, String> header = {"Content-type": "application/json", "Accept": "application/json"};

  Future<String?> generateCode(String cpf) async{
    final uri = Uri.parse(resourceAuth+"/generate-code");
    final cpfJson = {"cpf":cpf};
    var response = await http.post(uri, body: convert.jsonEncode(cpfJson), headers: header);
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse['code'];
    }
    return null;
  }

  login(String cpf, String code){

  }

}