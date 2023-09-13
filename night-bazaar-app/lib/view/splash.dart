import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/account/loginSignup/login_model.dart';
import 'package:prototip/view/assets.dart';
import 'package:prototip/view/base_scaffold.dart';

// Uygulamanın başlangıcında görünen Splash ekranı.
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

// Uygulamanın başlangıcında görünen LoginSplash ekranı.
class LoginSplash extends StatefulWidget {
  const LoginSplash({super.key});

  @override
  State<LoginSplash> createState() => _LoginSplashState();
}

class _LoginSplashState extends State<LoginSplash> {
  @override
  void initState() {
    // Ekranı 2 saniye görüntüledikten sonra kimlik doğrulaması yapıldıktan
    // sonra Login Sayfası ekranına geçiş yapar.
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => const LoginPage());
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

class ConnectingSplash extends StatefulWidget {
  const ConnectingSplash({super.key});

  @override
  State<ConnectingSplash> createState() => _ConnectingSplashState();
}

class _ConnectingSplashState extends State<ConnectingSplash> {
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: CircularProgressIndicator(
                color: Constant.ligthAmber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DisconnectingSplash extends StatefulWidget {
  const DisconnectingSplash({super.key});

  @override
  State<DisconnectingSplash> createState() => _DisconnectingSplashState();
}

class _DisconnectingSplashState extends State<DisconnectingSplash> {
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: CircularProgressIndicator(
                color: Constant.ligthAmber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
