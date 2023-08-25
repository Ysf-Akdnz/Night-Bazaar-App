import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/view/assets.dart';

// Uygulamanın başlangıcında görünen splash ekranı.
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // Ekranı 2 saniye görüntüledikten sonra BaseScaffold ekranına geçiş yapar.
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/authChecker");
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
            SizedBox(
              width: 200,
              height: 200,
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
