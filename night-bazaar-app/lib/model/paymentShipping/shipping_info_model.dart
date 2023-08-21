import 'package:prototip/model/paymentShipping/shipping_user.dart';

class ShippingInformationModel {
  String title;
  List<ShippingUser> userInfo;

  ShippingInformationModel({
    required this.title,
    required this.userInfo,
  });
}
