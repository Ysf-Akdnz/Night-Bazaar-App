import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/screens/cart_screen.dart';
import 'package:prototip/screens/home_screen.dart';
import 'package:prototip/screens/category_screen.dart';
import 'package:prototip/screens/profile_screen.dart';
import 'package:prototip/screens/wishlist_screen.dart';
import 'package:prototip/view/assets.dart';

double size = 25;

// Temel navigasyon çubuğunu yöneten BaseScaffoldRiverpod sınıfı.
class BaseScaffoldRiverpod extends ChangeNotifier {
  List<Widget> items = [
    SvgPicture.asset(Assets.icons.icCategoryIcon,
        color: Constant.ligthAmber, width: size),
    SvgPicture.asset(Assets.icons.icWishlistIcon,
        color: Constant.ligthAmber, width: size),
    SvgPicture.asset(Assets.icons.icHomeIcon,
        color: Constant.ligthAmber, width: size),
    SvgPicture.asset(Assets.icons.icCartIcon,
        color: Constant.ligthAmber, width: size),
    SvgPicture.asset(Assets.icons.icProfileIcon,
        color: Constant.ligthAmber, width: size),
  ];
  int currentIndex = 2; // Başlangıçta görüntülenecek sayfanın indeksi

  setCurrentIndex(int index) {
    currentIndex = index; // Seçilen indeksi güncelle
    notifyListeners();
  }

// Şu an seçilen sayfa indeksine göre ilgili Widget'ı döndürür.
  Widget getSelectedWidget() {
    switch (currentIndex) {
      case 0:
        return const CategoryScreen();
      case 1:
        return const WishlistScreen();
      case 2:
        return const HomeScreen();
      case 3:
        return const CartScreen();
      case 4:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }
}
