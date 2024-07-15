import 'package:flowers_store/herlpers/class/crud.dart';
import 'package:flowers_store/herlpers/constant/backlinks.dart';

class FavouriteData {
  Crud crud;
  FavouriteData(this.crud);
  getMyfavourites() async {
    var response = await crud.getData(url: getFavouriteNameLink,);
    return response;
  }

  addToFavourite(String productId) async {
    var response = await crud
        .postData(url: '$addToFavouriteNameLink$productId/favorites', data: {});
    return response;
  }

  removeFromFavourite(String productId) async {
    var response =
        await crud.deleteData(url: '$addToFavouriteNameLink$productId/favorites');
    return response;
  }
}
