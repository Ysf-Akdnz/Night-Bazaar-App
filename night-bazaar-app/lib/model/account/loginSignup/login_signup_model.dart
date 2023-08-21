import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prototip/model/account/loginSignup/components/build_bottom_half_container.dart';
import 'package:prototip/model/account/loginSignup/components/build_textfield.dart';
import 'package:prototip/model/account/loginSignup/components/facebook_google.dart';
import 'package:prototip/model/account/loginSignup/components/welcome_to.dart';

import '../../../constant/constant.dart';
import '../../../view/assets.dart';

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
        WelcomeTo(isSignupScreen: isSignupScreen),
        //Trick to add the shadow for the submit button
        BuildBottomHalfContainer(
            isSignupScreen: isSignupScreen, showShadow: true),
        //Main Container for Login and Signup
        mainContainer(context),
        //Trick  to add the submit button
        BuildBottomHalfContainer(
            isSignupScreen: isSignupScreen, showShadow: false),
        FacebookGoogle(isSignupScreen: isSignupScreen, context: context)
      ],
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

  Container buildLoginSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          BuildTextfield(
              icon: Assets.icons.email,
              hintText: "info@gmail.com",
              isEmail: true,
              isPassword: false),
          BuildTextfield(
              icon: Assets.icons.password,
              hintText: "***********",
              isEmail: false,
              isPassword: true),
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
          BuildTextfield(
              icon: Assets.icons.profile,
              hintText: "User Name",
              isEmail: false,
              isPassword: false),
          BuildTextfield(
              icon: Assets.icons.email,
              hintText: "Email",
              isEmail: true,
              isPassword: false),
          BuildTextfield(
              icon: Assets.icons.password,
              hintText: "Password",
              isEmail: false,
              isPassword: true),
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
}
