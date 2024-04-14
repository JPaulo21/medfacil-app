import 'package:medfacil_app/api/user_api.dart';

import '../models/user.dart';
import '../util/local_storage.dart';

class UserService{

  UserAPI userAPI = UserAPI();

  Future<bool> createUser(User user) async {
    var response = await userAPI.createUser(user);
    if(response == 201){
      LocalStorage.add(key: "cpf", value: user.cpf);
      return true;
    }
    return false;
  }

}