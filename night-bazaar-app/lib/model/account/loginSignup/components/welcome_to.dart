import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/view/assets.dart';

class WelcomeTo extends StatelessWidget {
  const WelcomeTo({
    Key? key,
    required this.isSignupScreen,
  }) : super(key: key);

  final bool isSignupScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 250,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.logSign), fit: BoxFit.fill),
            boxShadow: [BoxShadow(blurRadius: 75, color: Constant.nightAmber)]),
        child: Container(
          padding: const EdgeInsets.only(top: 40, left: 20),
          color: Constant.nightAmber.withOpacity(.4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "Welcome to",
                  style: Constant.ptSansNormal.copyWith(
                      fontSize: 25, color: Constant.white, letterSpacing: 1),
                  children: [
                    TextSpan(
                      text: isSignupScreen ? " Night Bazaar," : " Back,",
                      style: isSignupScreen
                          ? GoogleFonts.caveat(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Constant.white)
                          : GoogleFonts.ptSans(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Constant.white),
                    ),
                  ],
                ),
              ),
              Text(
                isSignupScreen ? "Signup to Continue" : "Signin to Continue",
                style: Constant.ptSansNormal
                    .copyWith(color: Constant.whitePurple, fontSize: 17.5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
