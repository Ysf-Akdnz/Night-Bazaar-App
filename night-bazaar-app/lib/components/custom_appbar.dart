import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/constant/constant.dart';

import '../view/assets.dart';

// Özelleştirilmiş app bar'ı oluşturan widget.
// ignore: must_be_immutable
class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  String appbarTitle;

  CustomAppbar({Key? key, this.appbarTitle = "Night Bazaar"})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Constant.whiteGrey.withOpacity(0.8),
      centerTitle: true,
      title: title(),
      // Sol taraftaki menü butonu.
      leading: menuIcon(),
      actions: [
        // Sağ taraftaki arama butonu.
        searchIcon(),
      ],
    );
  }

  Padding searchIcon() {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: SvgPicture.asset(
        Assets.icons.icSearchIcon,
        color: Constant.ligthAmber,
        width: 32,
        height: 32,
      ),
    );
  }

  Padding menuIcon() {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: SvgPicture.asset(
        Assets.icons.icMenuIcon,
        color: Constant.ligthAmber,
        width: 32,
        height: 32,
      ),
    );
  }

  Text title() {
    return Text(
      appbarTitle,
      style: GoogleFonts.caveat(
          fontStyle: FontStyle.italic,
          fontSize: 25,
          color: Constant.ligthAmber),
    );
  }
}
