import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototip/model/account/profile/pages/my_account/components/my_account_menu_model.dart';
import 'package:prototip/model/account/profile/pages/my_account/components/my_account_picture_model.dart';
import 'package:prototip/model/account/profile/pages/my_account/pages/address.dart';
import 'package:prototip/model/account/profile/pages/my_account/pages/changing_password.dart';
import 'package:prototip/model/account/profile/pages/my_account/pages/favorites.dart';
import 'package:prototip/model/account/profile/pages/my_account/pages/membership_details.dart';
import 'package:prototip/model/account/profile/pages/my_account/pages/orders.dart';
import 'package:prototip/model/account/profile/pages/my_account/pages/saved_cards.dart';
import 'package:prototip/view/assets.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const MyAccountPicture(),
          const SizedBox(height: 20),
          MyAccountMenu(
              icon: Assets.icons.orders,
              press: () {
                Get.to(() => const MyOrders(), transition: Transition.rightToLeft);
              },
              text: 'My Orders'),
          MyAccountMenu(
              icon: Assets.icons.bookmark,
              press: () {
                Get.to(() => const MyFavorites(), transition: Transition.rightToLeft);
              },
              text: 'My Favorites'),
          MyAccountMenu(
              icon: Assets.icons.location,
              press: () {
                Get.to(() => const MyAddress(), transition: Transition.rightToLeft);
              },
              text: 'My Addresses'),
          MyAccountMenu(
              icon: Assets.icons.creditCard,
              press: () {
                Get.to(() => const SavedCards(), transition: Transition.rightToLeft);
              },
              text: 'My Saved Cards'),
          MyAccountMenu(
              icon: Assets.icons.myAccount,
              press: () {
                Get.to(() => const MyMembershipDetails(),
                    transition: Transition.rightToLeft);
              },
              text: 'My Membership Details'),
          MyAccountMenu(
              icon: Assets.icons.password,
              press: () {
                Get.to(() => const ChangingPassword(),
                    transition: Transition.rightToLeft);
              },
              text: 'Changing Password'),
        ],
      ),
    );
  }
}
