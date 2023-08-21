import 'package:flutter/material.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/account/loginSignup/components/build_text_button.dart';
import 'package:prototip/view/assets.dart';

class FacebookGoogle extends StatelessWidget {
  const FacebookGoogle({
    Key? key,
    required this.isSignupScreen,
    required this.context,
  }) : super(key: key);

  final bool isSignupScreen;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
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
                BuildTextButton(
                    icon: Assets.icons.facebook,
                    title: "Facebook",
                    backgroundColor: Colors.blue.shade700),
                BuildTextButton(
                    icon: Assets.icons.google,
                    title: "Google",
                    backgroundColor: Colors.red.shade600)
              ],
            ),
          )
        ],
      ),
    );
  }
}
