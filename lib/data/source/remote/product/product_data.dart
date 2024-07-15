import 'package:flowers_store/herlpers/class/crud.dart';
import 'package:flowers_store/herlpers/constant/backlinks.dart';

class ProductData {
  Crud crud;
  ProductData(this.crud);
  getallProducts({Map<String, dynamic>? filter}) async {
    var response = await crud.getData(
        url:
            getallProductsNameLink,);
    return response;
  }

  String _toFilterString(Map<String, dynamic> map) {
    List<String> parts = [];

    map.forEach((key, value) {
      parts.add('$key=$value');
    });
    return '?filter=${parts.join(',')}';
  }
}
