
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prototip/constant/constant.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String text;
  final dynamic icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: GestureDetector(
        onTap: press,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 65,
          decoration: Constant.default1.copyWith(
            color: Constant.darkGrey,
            boxShadow: [
              const BoxShadow(
                  color: Constant.lightPurple,
                  blurRadius: 2,
                  offset: Offset(2, 2))
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SvgPicture.asset(
                  icon,
                  color: Constant.lightPurple,
                  width: 25,
                ),
              ),
              Expanded(
                child: Text(
                  text,
                  style: Constant.ptSansBold
                      .copyWith(color: Constant.lightPurple.withOpacity(0.8)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Constant.lightPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
