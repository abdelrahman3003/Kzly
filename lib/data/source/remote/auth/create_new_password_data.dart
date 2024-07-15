import 'package:flowers_store/herlpers/class/crud.dart';
import 'package:flowers_store/herlpers/constant/backlinks.dart';

class CreateNewPasswordData {
  Crud crud;
  CreateNewPasswordData(this.crud);
  sendresetPasswordOtp(
      {required String resetToken, required String newpassword}) async {
    var response = await crud.patchData(
         auth: true,
      url: "$forgetPasswordLink$resetToken",
      data: {"password": newpassword},
    );
    return response;
  }
}
