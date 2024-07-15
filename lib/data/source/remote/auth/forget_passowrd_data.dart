import 'package:flowers_store/herlpers/class/crud.dart';
import 'package:flowers_store/herlpers/constant/backlinks.dart';

class ForgetPasswordData {
  Crud crud;
  ForgetPasswordData(this.crud);
  getUserId(String email) async {
    var response = await crud.getData(
         auth: true,
      url: '$forgetPasswordLink$email',
    );
    return response;
  }

  sendresetPasswordOtp({required String userId, required String otpType}) async {
    var response = await crud.postData(
         auth: true,
      url: verifyNameLink,
      data: {
        "userId": userId,
        "OtpType": otpType,
      },
    );
    return response;
  }
}
