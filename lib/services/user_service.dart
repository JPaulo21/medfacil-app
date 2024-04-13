import 'package:medfacil_app/api/user_api.dart';

import '../models/user.dart';
import '../util/local_storage.dart';

class UserService{

  UserAPI userAPI = UserAPI();

  Future<bool> createUser(User user) async {
    var response = await userAPI.createUser(user);
    print('Response: ${response}');
    if(response == 201){
      print('cpf ${user.cpf}');
      LocalStorage.add(key: "cpf", value: user.cpf);
      print("chegou");
      return true;
    }
    return false;
  }

}