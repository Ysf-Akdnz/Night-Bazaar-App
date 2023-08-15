import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constant {
  /// [Colors]
  static Color black = const Color(0x00000000);
  static const Color white = Colors.white;
  static const Color grey = Colors.grey;
  static Color midgrey = const Color(0xFF424242).withOpacity(0.5);
  static const Color darkGrey = Color(0xFF121212);
  static const Color whiteGrey = Color(0xFF212121);
  static const Color cyan = Color(0xff00b8d4);
  static Color nightAmber = const Color(0xFFFFA000);
  static Color darkAmber = const Color(0xFFFF6F00);
  static const Color ligthAmber = Color(0xFFFFCA28);
  static const Color whiteAmber = Color(0xFFFFF082);
  static const Color amber = Color(0xFFFFC107);
  static const Color purple = Color(0xFFBB86FC);
  static const Color lightPurple = Color(0xFFB1BEE7);
  static const Color whitePurple = Color(0xFFF3E5F5);

  ///[TextStyle]
  static TextStyle ptSansNormal =
      GoogleFonts.ptSans(color: Constant.lightPurple);
  static TextStyle ptSansBold = GoogleFonts.ptSans(
      color: Constant.lightPurple, fontWeight: FontWeight.bold);
}
