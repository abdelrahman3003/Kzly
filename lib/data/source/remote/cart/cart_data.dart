import 'package:flowers_store/herlpers/class/crud.dart';
import 'package:flowers_store/herlpers/constant/backlinks.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  getMyCart() async {
    var response = await crud.getData(
      url: getMyCartNameLink,
    );
    return response;
  }

  addtoMyCart(String productId) async {
    var response = await crud.postData(
      url: "$addToMyCartNameLink$productId/items",
      data: {"quantity": 1},
    );
    return response;
  }

  increaseMyCart(String itemId) async {
    var response = await crud.patchData(
      url: "$increaseMyCartNameLink$itemId/increaseByOne",
      data: {},
    );
    return response;
  }

  decreaseMyCart(String itemId) async {
    var response = await crud.patchData(
      url: "$increaseMyCartNameLink$itemId/decreaseByOne",
      data: {},
    );
    return response;
  }

  removeItemMyCart(String itemId) async {
    var response = await crud.deleteData(
      url: "$removeItemNameLink$itemId",

    );
    return response;
  }
}
