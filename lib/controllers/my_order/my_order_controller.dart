import 'dart:developer';

import 'package:flowers_store/herlpers/shared/enums/enum.dart';
import 'package:get/get.dart';

List<Map<String, dynamic>> ordersProducts = [
  {
    "image":
        "https://res.cloudinary.com/di6nk1mov/image/upload/v1716717635/ghrl7l0nn2ew3cbg85n6.jpg",
    "name": "White Flower Fas",
    "stars": 5,
    "price": 850,
    "status": "Done",
    "days": "10 Days Ago",
    "countNo": 20
  },
  {
    "image":
        "https://images.pexels.com/photos/736230/pexels-photo-736230.jpeg?cs=srgb&dl=pexels-jonaskakaroto-736230.jpg&fm=jpg",
    "name": "Pink Flower Fas",
    "stars": 4,
    "price": 250,
    "status": "Decline",
    "days": "10 Days Ago",
    "countNo": 2
  },
  {
    "image":
        "https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg",
    "name": "Red Flower Fas",
    "stars": 5,
    "price": 890,
    "status": "Pending",
    "days": "10 Days Ago",
    "countNo": 24
  },
  {
    "image": "https://kidlingoo.com/wp-content/uploads/flowers_name_in_english.jpg",
    "name": "Purple Flower Fas",
    "stars": 4.5,
    "price": 750,
    "status": "Done",
    "days": "4 Days Ago",
    "countNo": 20
  },
  {
    "image":
        "https://res.cloudinary.com/di6nk1mov/image/upload/v1716717635/ghrl7l0nn2ew3cbg85n6.jpg",
    "name": "White Flower Fas",
    "stars": 5,
    "price": 850,
    "status": "Done",
    "days": "2 Days Ago",
    "countNo": 20
  },
  {
    "image":
        "https://img.freepik.com/free-photo/beautiful-blooming-flowers-spring-season_23-2150790288.jpg?size=626&ext=jpg&ga=GA1.1.1518270500.1717200000&semt=ais_user",
    "name": "Flowers Fas",
    "stars": 5,
    "price": 950,
    "status": "Done",
    "days": "5 Days Ago",
    "countNo": 20
  },
  {
    "image":
        "https://img.freepik.com/free-photo/vibrant-colors-nature-close-up-wet-purple-daisy-generated-by-artificial-intellingence_25030-63819.jpg",
    "name": "Rose Flower Fas",
    "stars": 4.5,
    "price": 1000,
    "status": "Decline",
    "days": "9 Days Ago",
    "countNo": 50
  },
  {
    "image":
        "https://images.unsplash.com/photo-1604085572504-a392ddf0d86a?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8b3JhbmdlJTIwZmxvd2VyfGVufDB8fDB8fHww",
    "name": "White Flower Fas",
    "stars": 5,
    "price": 850,
    "status": "Pending",
    "days": "5 Days Ago",
    "countNo": 10
  },
  {
    "image":
        "https://images.unsplash.com/photo-1604085572504-a392ddf0d86a?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8b3JhbmdlJTIwZmxvd2VyfGVufDB8fDB8fHww",
    "name": "White Flower Fas",
    "stars": 4,
    "price": 750,
    "status": "Pending",
    "days": "6 Days Ago",
    "countNo": 2
  },
  {
    "image":
        "https://contentgrid.homedepot-static.com/hdus/en_US/DTCCOMNEW/Articles/discover-the-secret-language-of-flowers-2022-hero.jpeg",
    "name": "Flowers Fas",
    "stars": 2.5,
    "price": 150,
    "status": "Decline",
    "days": "7 Days Ago",
    "countNo": 20
  },
  {
    "image":
        "https://hips.hearstapps.com/hmg-prod/images/close-up-of-blossoming-rose-flower-royalty-free-image-1580853844.jpg?crop=0.668xw:1.00xh;0.248xw,0&resize=980:*",
    "name": "White Flower Fas",
    "stars": 3,
    "price": 120,
    "status": "Done",
    "days": "6 Days Ago",
    "countNo": 10
  },
  {
    "image": "https://m.media-amazon.com/images/I/61mMytOBsJL._AC_SL1024_.jpg",
    "name": "Red Flower Fas",
    "stars": 5,
    "price": 850,
    "status": "Decline",
    "days": "10 Days Ago",
    "countNo": 20
  },
  {
    "image": "https://m.media-amazon.com/images/I/61mMytOBsJL._AC_SL1024_.jpg",
    "name": "Red Flower Fas",
    "stars": 5,
    "price": 850,
    "status": "Decline",
    "days": "10 Days Ago",
    "countNo": 20
  },
];

class MyOrderController extends GetxController {
  List<Map<String, dynamic>> displayOrders = [];
  List<Map<String, dynamic>> displayDoneOrders = [];
  List<Map<String, dynamic>> dispalayPendingOrders = [];
  List<Map<String, dynamic>> dispalayDeclineOrders = [];
  int tabindex = 0;
  @override
  void onInit() {
    super.onInit();
    displayOrders = List.from(ordersProducts);
    for (var element in displayOrders) {
      if (element["status"] == KzlyOrdersSections.done.name.capitalizeFirst) {
        displayDoneOrders.add(element);
      } else if (element["status"] ==
          KzlyOrdersSections.pending.name.capitalizeFirst) {
        dispalayPendingOrders.add(element);
      } else {
        dispalayDeclineOrders.add(element);
      }
    }
  }

  void selectedSection(value) {
    tabindex = value;
    log("$tabindex//$value");
    update();
  }

  void searchingList(searchingvalue) {
    log(searchingvalue);
      displayOrders = ordersProducts
          .where((element) => element["name"]
              .toString()
              .toLowerCase()
              .contains(searchingvalue.toString().toLowerCase()))
          .toList();
    
      displayDoneOrders = ordersProducts
          .where((element) =>
              element["status"] == KzlyOrdersSections.done.name.capitalizeFirst &&
              element["name"]
                  .toString()
                  .toLowerCase()
                  .contains(searchingvalue.toString().toLowerCase()))
          .toList();
    
      dispalayPendingOrders = ordersProducts
          .where((element) =>
              element["status"] == KzlyOrdersSections.pending.name.capitalizeFirst &&
              element["name"]
                  .toString()
                  .toLowerCase()
                  .contains(searchingvalue.toString().toLowerCase()))
          .toList();
    
      dispalayDeclineOrders = ordersProducts
          .where((element) =>
              element["status"] == KzlyOrdersSections.decline.name.capitalizeFirst &&
              element["name"]
                  .toString()
                  .toLowerCase()
                  .contains(searchingvalue.toString().toLowerCase()))
          .toList();
    update();
  }
}
