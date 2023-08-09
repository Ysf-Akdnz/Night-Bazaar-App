import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/screens/cart_screen.dart';
import 'package:prototip/screens/home_screen.dart';
import 'package:prototip/screens/menu_screen.dart';
import 'package:prototip/screens/profile_screen.dart';
import 'package:prototip/screens/wishlist_screen.dart';
import 'package:prototip/view/assets.dart';

class BaseScaffoldRiverpod extends ChangeNotifier {
  List<Widget> items = [
    SvgPicture.asset(Assets.icons.icMenuIcon, color: Constant.nightAmber),
    SvgPicture.asset(Assets.icons.icWishlistIcon, color: Constant.nightAmber),
    SvgPicture.asset(Assets.icons.icHomeIcon, color: Constant.nightAmber),
    SvgPicture.asset(Assets.icons.icCartIcon, color: Constant.nightAmber),
    SvgPicture.asset(Assets.icons.icProfileIcon, color: Constant.nightAmber),
  ];
  int currentIndex = 2; //navbar'da Başlangıç indeksi

  void setCurrentIndex(int index) {
    currentIndex = index; //
    notifyListeners();
  }

  Widget getSelectedWidget() {
    switch (currentIndex) {
      case 0:
        return MenuScreen();
      case 1:
        return WishlistScreen();
      case 2:
        return HomeScreen();
      case 3:
        return CartScreen();
      case 4:
        return ProfileScreen();
      default:
        return HomeScreen();
    }
  }
}
