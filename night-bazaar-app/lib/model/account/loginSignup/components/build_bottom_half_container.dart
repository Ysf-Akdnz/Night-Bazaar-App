import 'package:flutter/material.dart';
import 'package:prototip/constant/constant.dart';

class BuildBottomHalfContainer extends StatelessWidget {
  const BuildBottomHalfContainer({
    Key? key,
    required this.isSignupScreen,
    required this.showShadow,
  }) : super(key: key);

  final bool isSignupScreen;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
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
}
