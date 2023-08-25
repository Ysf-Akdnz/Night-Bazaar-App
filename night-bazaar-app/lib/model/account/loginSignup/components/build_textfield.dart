import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prototip/constant/constant.dart';

class BuildTextfield extends StatelessWidget {
  const BuildTextfield({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.isEmail,
    required this.isPassword,
    required this.textInputType,
    required this.controller,
    required this.isPasswordVisibile,
  }) : super(key: key);

  final dynamic icon;
  final String hintText;
  final bool isEmail;
  final bool isPassword;
  final bool isPasswordVisibile;
  final TextInputType textInputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: isPasswordVisibile,
        style: Constant.ptSansNormal.copyWith(color: Colors.white),
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
        ),
      ),
    );
  }
}
