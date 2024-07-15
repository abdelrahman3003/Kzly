import 'package:flowers_store/data/model/cart/cart.dart';
import 'package:flowers_store/data/source/remote/cart/cart_data.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/service/serviece.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  increaseMyCart(Cart cart, int index);
  decreaseMyCart(Cart cart, int index);
  removeItemMyCart(Cart cart);
  onCheck(Cart cart, bool val);
  selectAll(bool val);
  getMyCart();
}

class CartControllerImp extends CartController {
  bool isSelectAll = true;
  List<Cart> checkoutList = [];
  List<Cart> myCartList = [];
  List<int> quantities = [];
  AppServices appServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  CartData cartData = CartData(Get.find());
  int? totalPrice;
  int? totlaQuantity;

  @override
  increaseMyCart(Cart cart, int index) async {
    quantities[index]++;
    update();
    await cartData.increaseMyCart(cart.id!);
    update();
  }

  @override
  decreaseMyCart(Cart cart, int index) async {
    if (quantities[index] == 1) {
      myCartList.remove(cart);
    }
    quantities[index]--;
    update();

    await cartData.decreaseMyCart(cart.id!);
    update();
  }

  @override
  removeItemMyCart(Cart cart) async {
    myCartList.remove(cart);
    update();
    if (cart.isIncheckOut) {
      checkoutList.remove(cart);
    }
    await cartData.removeItemMyCart(cart.id!);

    update();
  }

  @override
  onCheck(Cart cart, bool val) {
    if (cart.isIncheckOut) {
      checkoutList.remove(cart);
    } else {
      checkoutList.add(cart);
    }

    cart.isIncheckOut = val;
    if (checkoutList.length != myCartList.length) {
      isSelectAll = false;
    } else {
      isSelectAll = true;
    }
    update();
  }

  @override
  void onInit() {
    getMyCart();
    super.onInit();
  }

  @override
  selectAll(bool val) {
    isSelectAll = val;
    myCartList.forEach((cart) {
      cart.isIncheckOut = val;
    });
    if (isSelectAll) {
      checkoutList.addAll(myCartList);
    } else {
      checkoutList.clear();
    }
    update();
  }

  @override
  getMyCart() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getMyCart();
    List data = response["data"]['items'];
    totalPrice = response["data"]['totalPrice'];
    totlaQuantity = response["data"]['totalQuantity'];

    if (response["status"] == "success") {
      statusRequest = StatusRequest.success;
      myCartList.addAll(data.map((e) => Cart.fromJson(e)));
      myCartList.forEach((cart) {
        quantities.add(cart.quantity!);
        checkoutList.add(cart);
      });
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }
}
