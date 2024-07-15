import 'package:flowers_store/herlpers/class/crud.dart';
import 'package:flowers_store/herlpers/constant/backlinks.dart';

class CategoryData {
  Crud crud;
  CategoryData(this.crud);

  getCategires({Map<String, dynamic>? filter}) async {
    var response = await crud.getData(
      url: "$getCategoriesNameLink${filter != null ? _toFilterString(filter) : ''}",
      
    );
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
