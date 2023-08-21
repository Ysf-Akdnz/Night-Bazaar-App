import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:prototip/components/custom_button.dart';
import 'package:prototip/riverpod/checkout_riverpod.dart';

import '../components/shipping_info.dart';
import '../constant/constant.dart';
import '../model/paymentShipping/pament_model.dart';

final shippingInfo = ChangeNotifierProvider(((ref) => ShippingInformation()));

class CheckoutView extends ConsumerWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(shippingInfo);
    var read = ref.read(shippingInfo);

    var user = watch.shipInfoModel.userInfo[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constant.darkGrey,
        elevation: 0,
        title: Text(
          "checkout",
          style: Constant.ptSansBold.copyWith(fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.keyboard_arrow_right_rounded,
            color: Constant.lightPurple,
            size: 40,
          ),
          color: Constant.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(children: [
          ShippingInfo(read: read, user: user),
          const PaymentMethodModel(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: Constant.ptSansBold.copyWith(fontSize: 30),
                ),
                Text(
                  "\$2598",
                  style: Constant.ptSansBold.copyWith(fontSize: 40),
                )
              ],
            ),
          ),
          CustomButton(onTap: () {}, text: "Confirm & Pay")
        ]),
      ),
    );
  }
}
