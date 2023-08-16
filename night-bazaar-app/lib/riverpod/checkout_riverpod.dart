import 'package:flutter/material.dart';
import 'package:prototip/model/shipping_user.dart';
import 'package:prototip/model/shipping_info_model.dart';

class ShippingInformation extends ChangeNotifier {
  ShippingInformationModel shipInfoModel =
      ShippingInformationModel(title: "Shipping information", userInfo: [
    ShippingUser(
        name: "Yusuf Akdeniz",
        location: "İstiklal Cad. No: 123, İstanbul",
        phoneNumber: "123-456-7890")
  ]);
}
