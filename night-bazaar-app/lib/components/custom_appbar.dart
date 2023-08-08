import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/constant/constant.dart';

import '../view/assets.dart';

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
      actions: [
        Padding(
          padding: EdgeInsets.all(13),
          child: SvgPicture.asset(
            Assets.icons.icSearchIcon,
            color: Constant.ligthAmber,
            width: 32,
            height: 32,
          ),
        ),
      ],
      flexibleSpace: Stack(
        children: [
          Container(
            margin: const EdgeInsetsDirectional.only(start: 15),
            alignment: Alignment.centerLeft,
            child: Text(
              appbarTitle,
              style: GoogleFonts.caveat(
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                  color: Constant.ligthAmber),
            ),
          ),
        ],
      ),
    );
  }
}
