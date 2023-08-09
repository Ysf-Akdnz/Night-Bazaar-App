import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/view/assets.dart';

class CostumBottomNavBar extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final int initialIndex; //Başlangıç indeksi
  final ValueChanged<int>
      onIndexChanged; //Indeksin değiştiğinde geri çağrı işlevi

  CostumBottomNavBar({
    Key? key,
    required this.initialIndex,
    required this.onIndexChanged,
  })  : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  State<CostumBottomNavBar> createState() => _CostumBottomNavBarState();
}

class _CostumBottomNavBarState extends State<CostumBottomNavBar> {
  int index = 1;

  @override
  void initState() {
    index = widget.initialIndex; //Başlangıçta verilen indek değeri
    super.initState();
  }

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
          index = selectedIndex; //Seçilen simgenin indeksini güncelle
          widget.onIndexChanged(
              selectedIndex); //MainScreendeki indeksi güncellemek için geri çağrı yap
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
