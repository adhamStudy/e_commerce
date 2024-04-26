import 'package:e_commerce/core/class/funcrtions/handlind_data.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_source/remote/cart_data.dart';
import 'package:e_commerce/data/model/cart_model.dart';
import 'package:e_commerce/data/model/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  addItems(String itemId);
  removeItems(String itemId);
  view();
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest stutusRequest = StatusRequest.initial;
  List<CartModel> data = [];
  double priceOrder = 0;
  String countOrder = '0';
  String? couponName;
  int? couponId;
  double totalPrice = 0;
  CouponModel? couponData;
  TextEditingController? checkCoponController;
  int discount = 0;
  @override
  addItems(String itemId) async {
    stutusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString('id')!, itemId.toString());
    print('=========================================================$response');
    stutusRequest = handlingData(response);
    if (StatusRequest.success == stutusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar(
          'Success',
          'Item Added to Cart',
          colorText: AppColors.black,
          snackStyle: SnackStyle.FLOATING,
          backgroundColor: Colors.green.withOpacity(0.5),
        );
      } else {
        stutusRequest = StatusRequest.failure;
      }
    }
    refreshPage();
  }

  @override
  removeItems(String itemId) async {
    stutusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        myServices.sharedPreferences.getString('id')!, itemId.toString());
    print('=========================================================$response');
    stutusRequest = handlingData(response);
    if (StatusRequest.success == stutusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar(
          'Success',
          'Item Deleted from Cart',
          colorText: AppColors.black,
          snackStyle: SnackStyle.FLOATING,
          backgroundColor: Colors.green.withOpacity(0.5),
        );
      } else {
        stutusRequest = StatusRequest.failure;
      }
    }
    refreshPage();
  }

  @override
  view() async {
    stutusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString('id')!);
    print('=========================================================$response');
    stutusRequest = handlingData(response);
    if (StatusRequest.success == stutusRequest) {
      if (response['status'] == 'success') {
        if (response['data_cart']['status'] == 'success') {
          data.clear();
          response['data_cart']['data']
              .map((e) => data.add(CartModel.fromJson(e)))
              .toList();
          priceOrder = response['count_price']['total_price'].toDouble();
          totalPrice = response['count_price']['total_price'].toDouble();
          countOrder = response['count_price']['item_count'];
        }
      } else {
        stutusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    refreshPage();
    checkCoponController = TextEditingController();

    super.onInit();
  }

  resetVarCart() {
    priceOrder = 0;
    countOrder = '0';
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  checkCoupon() async {
    stutusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(checkCoponController!.text);
    print('=========================================================$response');
    stutusRequest = handlingData(response);
    if (StatusRequest.success == stutusRequest) {
      if (response['status'] == 'success') {
        couponData = CouponModel.fromJson(response['data']);
        discount = response['data']['coupon_discount'];
        couponName = response['data']['coupon_name'];
        couponId = response['data']['coupon_id'];
        Get.snackbar(
          'Success',
          'Item Deleted from Cart',
          colorText: AppColors.black,
          snackStyle: SnackStyle.FLOATING,
          backgroundColor: Colors.green.withOpacity(0.5),
        );
        getTotalPrice();
      } else {
        discount = 0;
        couponName = null;
        Get.snackbar(
          'Error',
          'Unvalid Coupon',
          colorText: AppColors.black,
          snackStyle: SnackStyle.FLOATING,
          backgroundColor: Colors.green.withOpacity(0.5),
        );

      }
    }
    refreshPage();
  }

  openDialog() {
    Get.defaultDialog(
      title: 'Enter Coupon',
      content: TextField(
        controller: checkCoponController,
        onChanged: (value) {},
        decoration: const InputDecoration(
          hintText: 'Enter coupon code',
        ),
      ),
      confirm: TextButton(
        onPressed: () {
          checkCoupon();
          Get.back();
          checkCoponController!.clear();
          // Perform any desired actions with the coupon value
        },
        child: const Text('Save'),
      ),
    );
  }

  getTotalPrice() {
    priceOrder = priceOrder - priceOrder * (discount / 100);
    return priceOrder;
  }

  gotoPageCheckout() {
    if (data.isEmpty) {
      Get.snackbar('warning', 'cart is empty');
    } else {
      Get.toNamed(AppRoute.checkout, arguments: {
        'couponid': couponId,
        'priceorder': totalPrice,
        'discount': discount
      });
    }
  }
}
