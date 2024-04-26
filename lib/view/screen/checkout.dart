import 'package:e_commerce/controller/checkout_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/image_asset.dart';
import 'package:e_commerce/view/widget/checkout/carddeleverytype.dart';
import 'package:e_commerce/view/widget/checkout/cardpaymentmethod.dart';
import 'package:e_commerce/view/widget/checkout/cardshippingaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: MaterialButton(
          color: AppColors.primaryColor,
          textColor: Colors.white,
          onPressed: () {
            controller.checkoutOrder();
          },
          child: const Text("Checkout",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
      ),
      body: GetBuilder<CheckoutController>(
          builder: (controller) => HandlingDataVeiw(
              stutusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      const Text(
                        "Choose Payment Method",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("0");
                        },
                        child: CardPaymentMethodCheckout(
                            title: "Cash On Delivery",
                            isActive:
                                controller.paymentMethod == "0" ? true : false),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("1");
                        },
                        child: CardPaymentMethodCheckout(
                            title: "Payment Cards",
                            isActive:
                                controller.paymentMethod == "1" ? true : false),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Choose Delivery Type",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("0");
                              print(controller.deliveryType); // 0=> cash
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: ImageAsset.drivethruImage,
                                title: "Delivery",
                                active: controller.deliveryType == "0"
                                    ? true
                                    : false),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("1"); // 1 => card
                                    print(controller.deliveryType); // 0=> cash
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: ImageAsset.drivethruImage,
                                title: "Revice",
                                active: controller.deliveryType == "1"
                                    ? true
                                    : false),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (controller.deliveryType == "0")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Shipping Address",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            ...List.generate(
                              controller.dataaddress.length,
                              (index) => InkWell(
                                onTap: () {
                                  controller.chooseShippingAddress(controller
                                      .dataaddress[index].addressId!
                                      .toString());
                                },
                                child: CardShppingAddressCheckout(
                                    title:
                                        "${controller.dataaddress[index].addressName}",
                                    body:
                                        "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                                    isactive: controller.addressid ==
                                            controller
                                                .dataaddress[index].addressId
                                                .toString()
                                        ? true
                                        : false),
                              ),
                            )
                          ],
                        )
                    ],
                  )))),
    );
  }
}
