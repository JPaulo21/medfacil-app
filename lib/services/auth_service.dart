import 'package:medfacil_app/api/auth_api.dart';

class AuthService {

  AuthAPI authAPI = AuthAPI();

  Future<String?> requestCode(String cpf) async {
    String? code = await authAPI.generateCode(cpf);
    if(code == null){
      return null;
    }
    return code;
  }
}