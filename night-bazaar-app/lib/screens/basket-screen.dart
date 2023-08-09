import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/view/assets.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Basket",
          style: GoogleFonts.eduSaBeginner(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30),
        CircleAvatar(
          backgroundColor: Constant.ligthAmber,
          radius: 70,
          child: SvgPicture.asset(
            Assets.icons.icBasketIcon,
            color: Constant.darkGrey,
            width: 50,
          ),
        ),
        Text(
          "Basket Page Content",
          style: GoogleFonts.eduSaBeginner(fontSize: 30, color: Colors.white),
        ),
      ],
    );
  }
}
