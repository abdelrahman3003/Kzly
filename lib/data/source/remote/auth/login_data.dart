import 'package:flowers_store/herlpers/class/crud.dart';
import 'package:flowers_store/herlpers/constant/backlinks.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  login(String email, String password) async {
    var response = await crud.postData(
      auth: true,
      url: loginNameLink,
      data: {"email": email, "password": password},
    );
    return response;
  }
}
