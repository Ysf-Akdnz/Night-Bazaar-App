import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';

class CheckoutView extends ConsumerWidget {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          icon: Icon(
            Icons.keyboard_arrow_right_rounded,
            color: Constant.lightPurple,
            size: 40,
          ),
          color: Constant.black,
        ),
      ),
      body: ListView(children: [
        /*
          Shopping information: Bir model olarak yap.
          - Model dinamik olsun.
          - Column içinde row, row içinde 2 tane text,
            ayrıca parent olan column içinde tek bir model(dinamik olan bir yapı olacak; 
            user name, user location, user phone number) olacak şekilde yap.
        */

        /*
          Payment Method: Bir model olarak yap.
          - Model dinamik olsun.
          - Group radio buttonları kullan.
          - Payment metodlarını seçerken yine model kullan.
          - enums kullan.
          - 
        */
      ]),
    );
  }
}
