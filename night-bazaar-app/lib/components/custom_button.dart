import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/constant.dart';

//
// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  Function onTap;
  String text;
  CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ElevatedButton(
        onPressed: () => onTap(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Constant.darkAmber,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          text,
          style: GoogleFonts.ptSans(
              color: Constant.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
