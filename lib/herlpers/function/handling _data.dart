import 'package:flowers_store/herlpers/class/statuscode.dart';

handlingApiData(response) {
  if (response is StatusRequest) {
    return response;
  }
  return StatusRequest.success;
}
