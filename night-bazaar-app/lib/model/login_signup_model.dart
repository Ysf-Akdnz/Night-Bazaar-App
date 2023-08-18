import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/constant.dart';
import '../view/assets.dart';

// ignore: use_key_in_widget_constructors
class LoginSignupModel extends StatefulWidget {
  @override
  State<LoginSignupModel> createState() => _LoginSignupModelState();
}

class _LoginSignupModelState extends State<LoginSignupModel> {
  bool isMale = true;

  bool isSignupScreen = true;

  bool isRememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        welcomeTo(),
        //Trick to add the shadow for the submit button
        buildBottomHalfContainer(true),
        //Main Container for Login and Signup
        mainContainer(context),
        //Trick  to add the submit button
        buildBottomHalfContainer(false),
        facebookGoogle(context)
      ],
    );
  }

  Positioned welcomeTo() {
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

  AnimatedPositioned mainContainer(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
      top: 140,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.linear,
        height: isSignupScreen ? 375 : 250,
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width - 40,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: Constant.loginSignup,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSignupScreen = false;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          "LOGIN",
                          style: Constant.ptSansBold.copyWith(
                            fontSize: 18,
                            color: !isSignupScreen
                                ? Constant.lightPurple
                                : Constant.lightPurple.withOpacity(0.5),
                          ),
                        ),
                        if (!isSignupScreen)
                          Container(
                            width: 55,
                            height: 2,
                            padding: const EdgeInsets.only(top: 5),
                            color: Constant.nightAmber,
                          )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSignupScreen = true;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          "SIGNUP",
                          style: Constant.ptSansBold.copyWith(
                              fontSize: 18,
                              color: isSignupScreen
                                  ? Constant.lightPurple
                                  : Constant.lightPurple.withOpacity(0.5)),
                        ),
                        if (isSignupScreen)
                          Container(
                            width: 55,
                            height: 2,
                            padding: const EdgeInsets.only(top: 5),
                            color: Constant.nightAmber,
                          )
                      ],
                    ),
                  )
                ],
              ),
              isSignupScreen ? buildSignupSection() : buildLoginSection(),
            ],
          ),
        ),
      ),
    );
  }

  Positioned facebookGoogle(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * .7,
      right: 0,
      left: 0,
      child: Column(
        children: [
          Text(
            isSignupScreen ? "Or Signup with" : "Or Signin with",
            style: Constant.ptSansBold
                .copyWith(color: Constant.lightPurple.withOpacity(.8)),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20, left: 20, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTextButton(
                    Assets.icons.facebook, "Facebook", Colors.blue.shade700),
                buildTextButton(
                    Assets.icons.google, "Google", Colors.red.shade600)
              ],
            ),
          )
        ],
      ),
    );
  }

  AnimatedPositioned buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
      top: isSignupScreen ? 470 : 350,
      left: 75,
      right: 75,
      child: Container(
        width: 90,
        height: 90,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Constant.greyShade900,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            if (showShadow)
              BoxShadow(
                  color: Constant.lightPurple.withOpacity(.4),
                  spreadRadius: 1.5,
                  blurRadius: 10,
                  offset: const Offset(0, 1))
          ],
        ),
        child: !showShadow
            ? Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Constant.darkGrey, Constant.nightAmber],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Constant.nightAmber.withOpacity(.4),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(2, 0))
                  ],
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Constant.greyShade900,
                  size: 30,
                ),
              )
            : const Center(),
      ),
    );
  }

  Container buildLoginSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextfield(Assets.icons.email, "info@gmail.com", true, false),
          buildTextfield(Assets.icons.password, "***********", false, true),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Constant.nightAmber,
                    checkColor: Constant.darkGrey,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  Text(
                    "Remember Me",
                    style: Constant.ptSansBold.copyWith(
                      color: Constant.lightPurple.withOpacity(.65),
                    ),
                  )
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: Constant.ptSansBold.copyWith(
                    color: Constant.lightPurple.withOpacity(.65),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextfield(Assets.icons.profile, "User Name", false, false),
          buildTextfield(Assets.icons.email, "Email", true, false),
          buildTextfield(Assets.icons.password, "Password", false, true),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: isMale
                                ? Constant.nightAmber
                                : Colors.transparent,
                            border: Border.all(
                                width: 1, color: Constant.greyShade900),
                            borderRadius: BorderRadius.circular(15)),
                        child: SvgPicture.asset(Assets.icons.male,
                            color: isMale
                                ? Constant.greyShade900
                                : Constant.whitePurple.withOpacity(.65)),
                      ),
                      Text(
                        "Male",
                        style: Constant.ptSansBold.copyWith(
                            color: isMale
                                ? Constant.nightAmber
                                : Constant.whitePurple.withOpacity(0.65)),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: !isMale
                                ? Constant.nightAmber
                                : Colors.transparent,
                            border: Border.all(
                                width: 1, color: Constant.greyShade900),
                            borderRadius: BorderRadius.circular(15)),
                        child: SvgPicture.asset(
                          Assets.icons.female,
                          color: !isMale
                              ? Constant.greyShade900
                              : Constant.whitePurple.withOpacity(.65),
                        ),
                      ),
                      Text(
                        "Female",
                        style: Constant.ptSansBold.copyWith(
                            color: !isMale
                                ? Constant.nightAmber
                                : Constant.whitePurple.withOpacity(0.65)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 200,
            margin: const EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "By pressing 'Submit' you agree to our",
                  style: Constant.ptSansBold.copyWith(
                    color: Constant.lightPurple.withOpacity(.8),
                  ),
                  children: [
                    TextSpan(
                      text: " term & conditions",
                      style: Constant.ptSansBold
                          .copyWith(color: Constant.nightAmber),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }

  TextButton buildTextButton(
      dynamic icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          foregroundColor: Constant.white,
          side:
              BorderSide(width: 1, color: Constant.lightPurple.withOpacity(.5)),
          minimumSize: const Size(145, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 25,
            color: Constant.white,
          ),
          const SizedBox(width: 5),
          Text(title),
        ],
      ),
    );
  }

  Widget buildTextfield(
      dynamic icon, String hintText, bool isEmail, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
          cursorColor: Constant.whitePurple,
          decoration: InputDecoration(
            prefixIcon: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(left: 10),
              child: SvgPicture.asset(icon,
                  color: Constant.whitePurple.withOpacity(0.65), height: 20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Constant.whitePurple.withOpacity(0.65)),
              borderRadius: const BorderRadius.all(Radius.circular(35.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Constant.whitePurple.withOpacity(0.65)),
              borderRadius: const BorderRadius.all(Radius.circular(35.0)),
            ),
            contentPadding: const EdgeInsets.all(10),
            hintText: hintText,
            hintStyle: Constant.ptSansNormal
                .copyWith(color: Constant.whitePurple.withOpacity(0.5)),
          )),
    );
  }
}
