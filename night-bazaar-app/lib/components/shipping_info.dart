import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/constant.dart';
import '../model/paymentShipping/shipping_user.dart';
import '../riverpod/checkout_riverpod.dart';
import '../view/assets.dart';

class ShippingInfo extends StatelessWidget {
  const ShippingInfo({
    Key? key,
    required this.read,
    required this.user,
  }) : super(key: key);

  final ShippingInformation read;
  final ShippingUser user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                read.shipInfoModel.title,
                style: Constant.ptSansBold,
              ),
              Text(
                "change",
                style: Constant.font1,
              )
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: Constant.default1,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.profile,
                        color: Constant.whitePurple,
                        width: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        user.name,
                        style: Constant.shipping,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.location,
                        color: Constant.whitePurple,
                        width: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        user.location,
                        style: Constant.shipping,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.call,
                        color: Constant.whitePurple,
                        width: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        user.phoneNumber,
                        style: Constant.shipping,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
