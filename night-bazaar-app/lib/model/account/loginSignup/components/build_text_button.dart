import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prototip/constant/constant.dart';

class BuildTextButton extends StatelessWidget {
  const BuildTextButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.backgroundColor,
  }) : super(key: key);

  final dynamic icon;
  final String title;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
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
}
