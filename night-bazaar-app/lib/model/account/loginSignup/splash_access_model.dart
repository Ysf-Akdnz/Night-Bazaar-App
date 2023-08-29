import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/components/custom_buttons.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/account/loginSignup/login_model.dart';

class SplashAccess extends StatelessWidget {
  const SplashAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: RichText(
                    text: TextSpan(
                      text: "Welcome to",
                      style: Constant.ptSansNormal.copyWith(
                          fontSize: 25,
                          color: Constant.white,
                          letterSpacing: 1),
                      children: [
                        TextSpan(
                            text: " Night Bazaar",
                            style: GoogleFonts.caveat(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Constant.white)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.warning,
                        size: 48.0,
                        color: Colors.orange,
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "You must be logged in to access profile information",
                        style: Constant.ptSansNormal.copyWith(
                            color: Constant.whitePurple, fontSize: 17.5),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 75),
                  child: CustomButtonTwo(
                      onTap: () {
                        Get.to(() => const LoginPage(),
                            transition: Transition.downToUp);
                      },
                      text: "Continue"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
