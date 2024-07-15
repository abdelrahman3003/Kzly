import 'package:flowers_store/herlpers/class/crud.dart';
import 'package:flowers_store/herlpers/constant/backlinks.dart';

class LogOutData {
  Crud crud;
  LogOutData(this.crud);
  logout() async {
    var response = await crud.deleteData(url: logOutNameLink);
    return response;
  }
}
