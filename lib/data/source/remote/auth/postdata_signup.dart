import 'package:flowers_store/herlpers/class/crud.dart';
import 'package:flowers_store/herlpers/constant/backlinks.dart';

class PostDataSignup {
  Crud crud;
  PostDataSignup(this.crud);
  postDataSignup(
      String fullName, String phone, String email, String password) async {
    var response = await crud.postData(
      auth: true,
      url: signupNameLink,
      data: {
        "fullName": fullName,
        "phone": phone,
        "email": email,
        "password": password,
        "gender": "male",
      },
    );

    return response;
  }

  gettVerifyCode(String userId, String otpType) async {
    var response = await crud.postData(
         auth: true,
      url: verifyNameLink,
      data: {"userId": userId, "OtpType": otpType},
    );
    return response;
  }
}
