import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prototip/components/custom_appbar.dart';
import 'package:prototip/components/custom_bottom_navbar.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/screens/basket-screen.dart';
import 'package:prototip/screens/home-screen.dart';
import 'package:prototip/screens/menu-screen.dart';
import 'package:prototip/screens/profile-screen.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int index = 1; //Başlangıç indeksi

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constant.darkGrey,
        appBar: CustomAppbar(),
        bottomNavigationBar: CostumBottomNavBar(
          initialIndex: index, //ButtomNavBarın başlangıç indeksi
          onIndexChanged: (newIndex) {
            setState(() {
              index = newIndex; //MainScreendeki indeksi güncelle
            });
          },
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index),
        ),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = MenuScreen();
        break;
      case 1:
        widget = HomeScreen();
        break;
      case 2:
        widget = BasketScreen();
        break;
      case 3:
        widget = ProfileScreen();
        break;
      default:
        widget = HomeScreen();
        break;
    }
    return widget;
  }
}
