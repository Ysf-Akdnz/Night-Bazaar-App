import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototip/constant/constant.dart';

class ChangingPassword extends StatefulWidget {
  const ChangingPassword({super.key});

  @override
  State<ChangingPassword> createState() => _ChangingPasswordState();
}

class _ChangingPasswordState extends State<ChangingPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constant.darkGrey,
        elevation: 0,
        title: Text(
          "Changing Password",
          style: Constant.ptSansBold.copyWith(fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.keyboard_arrow_right_rounded,
            color: Constant.lightPurple,
            size: 40,
          ),
          color: Constant.black,
        ),
      ),
    );
  }
}
