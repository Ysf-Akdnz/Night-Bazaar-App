import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/view/assets.dart';

class CostumButtomNavBar extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  CostumButtomNavBar({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  State<CostumButtomNavBar> createState() => _CostumButtomNavBarState();
}

class _CostumButtomNavBarState extends State<CostumButtomNavBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: index,
      height: 56,
      backgroundColor: Colors.transparent,
      animationDuration: const Duration(milliseconds: 300),
      color: Constant.whiteGrey.withOpacity(0.5),
      onTap: (selectedIndex) {
        setState(() {
          index = selectedIndex;
        });
      },
      items: [
        SvgPicture.asset(
          Assets.icons.icMenuIcon,
          color: Constant.nightAmber,
        ),
        SvgPicture.asset(
          Assets.icons.icHomeIcon,
          color: Constant.nightAmber,
        ),
        SvgPicture.asset(
          Assets.icons.icBasketIcon,
          color: Constant.nightAmber,
        ),
        SvgPicture.asset(
          Assets.icons.icProfileIcon,
          color: Constant.nightAmber,
        )
      ],
    );
  }
}
