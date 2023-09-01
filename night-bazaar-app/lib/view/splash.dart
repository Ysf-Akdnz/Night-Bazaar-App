import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/view/assets.dart';
import 'package:prototip/view/base_scaffold.dart';

// Uygulamanın başlangıcında görünen splash ekranı.
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // Ekranı 2 saniye görüntüledikten sonra kimlik doğrulaması yapıldıktan
    // sonra BaseScaffold ekranına geçiş yapar.
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => BaseScaffold());
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

class LoginSplash extends StatefulWidget {
  const LoginSplash({super.key});

  @override
  State<LoginSplash> createState() => _LoginSplashState();
}

class _LoginSplashState extends State<LoginSplash> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.to(() => BaseScaffold());
      },
    );
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
            Text(
              "Connecting...",
              style: GoogleFonts.ptSans(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color: Constant.ligthAmber),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: const CircularProgressIndicator(
                color: Constant.ligthAmber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingOutSplash extends StatefulWidget {
  const SingOutSplash({super.key});

  @override
  State<SingOutSplash> createState() => _SingOutSplashState();
}

class _SingOutSplashState extends State<SingOutSplash> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.to(() => BaseScaffold());
      },
    );
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
            Text(
              "Disconnecting...",
              style: GoogleFonts.ptSans(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color: Constant.ligthAmber),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: const CircularProgressIndicator(
                color: Constant.ligthAmber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
