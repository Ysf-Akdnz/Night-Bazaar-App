import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototip/components/custom_button.dart';
import 'package:prototip/constant/constant.dart';

class ChangingPassword extends StatefulWidget {
  const ChangingPassword({super.key});

  @override
  State<ChangingPassword> createState() => _ChangingPasswordState();
}

class _ChangingPasswordState extends State<ChangingPassword> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newPasswordRepeatController =
      TextEditingController();
  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _newPasswordRepeatController.dispose();
    super.dispose();
  }

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
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(),
          child: Column(
            children: [
              ChangingPasswordTextfield(
                  labelText: "Current Password",
                  controller: _currentPasswordController),
              ChangingPasswordTextfield(
                  labelText: "New Password",
                  controller: _newPasswordController),
              ChangingPasswordTextfield(
                  labelText: "New Password Repeat",
                  controller: _newPasswordRepeatController),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomButton(onTap: () {}, text: "Save")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChangingPasswordTextfield extends StatefulWidget {
  ChangingPasswordTextfield({
    Key? key,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;

  @override
  State<ChangingPasswordTextfield> createState() =>
      _ChangingPasswordTextfieldState();
}

class _ChangingPasswordTextfieldState extends State<ChangingPasswordTextfield> {
  bool isPasswordVisibile = true;

  void _togglePasswordVisibility() {
    setState(() {
      isPasswordVisibile = !isPasswordVisibile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        obscureText: isPasswordVisibile,
        controller: widget.controller,
        style: const TextStyle(color: Constant.white),
        keyboardType: TextInputType.phone,
        cursorColor: Constant.whitePurple,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: _togglePasswordVisibility,
            icon: Icon(isPasswordVisibile
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined),
            color: Constant.nightAmber.withOpacity(.7),
          ),
          labelText: widget.labelText,
          labelStyle: Constant.ptSansBold
              .copyWith(color: Constant.lightPurple.withOpacity(0.8)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Constant.whitePurple.withOpacity(0.5),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Constant.nightAmber.withOpacity(.5),
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        ),
      ),
    );
  }
}
