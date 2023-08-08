import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/view/assets.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/home");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.darkGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              //padding: EdgeInsets.all(115),
              child: Image.asset(
                Assets.images.imSplashPNG,
                color: Constant.ligthAmber,
              ),
            ),
            Text(
              "Nigth Bazaar",
              style: GoogleFonts.caveat(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 31,
                  color: Constant.ligthAmber),
            ),
          ],
        ),
      ),
    );
  }
}
