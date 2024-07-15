import 'package:flowers_store/herlpers/class/crud.dart';
import 'package:flowers_store/herlpers/constant/backlinks.dart';

class GetVerifyCode {
  Crud crud;
  GetVerifyCode(this.crud);
  resendVerifyCode(String id, String otp) async {
    var response = await crud.patchData(
      auth: true,
      url: "$sendCodeNameLink$id",
      data: {"otp": otp},
    );
    return response;
  }

  verifyResetPassOtp(
      {required String userId, required String otpType, required String otp}) async {
    var response = await crud.postData(
      auth: true,
      url: "$verifyResetPassOtpLink$otp",
      data: {
        "userId": userId,
        "OtpType": "RESET_PASSWORD",
      },
    );

    return response;
  }
}
