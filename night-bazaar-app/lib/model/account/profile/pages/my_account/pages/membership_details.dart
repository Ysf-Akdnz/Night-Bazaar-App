import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototip/components/custom_button.dart';
import 'package:prototip/constant/constant.dart';

class MyMembershipDetails extends StatefulWidget {
  const MyMembershipDetails({super.key});

  @override
  State<MyMembershipDetails> createState() => _MyMembershipDetailsState();
}

class _MyMembershipDetailsState extends State<MyMembershipDetails> {
  final TextEditingController _firstNameController =
      TextEditingController(text: "Yusuf");
  final TextEditingController _lastNameController =
      TextEditingController(text: "Akdeniz");
  final TextEditingController _emailController =
      TextEditingController(text: "admin@admin.com");
  final TextEditingController _phoneController =
      TextEditingController(text: "1234567890");
  final TextEditingController _birthDateController =
      TextEditingController(text: "01/01/1998");

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Constant.darkGrey,
        elevation: 0,
        title: Text(
          "My Membership Details",
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
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  MembershipBuildTextfield(
                      controller: _firstNameController,
                      textInputType: TextInputType.name,
                      labelText: "Yusuf"),
                  MembershipBuildTextfield(
                      controller: _lastNameController,
                      textInputType: TextInputType.name,
                      labelText: "Akdeniz"),
                  MembershipBuildTextfield(
                      controller: _emailController,
                      textInputType: TextInputType.emailAddress,
                      labelText: "admin@admin.com"),
                  MembershipBuildTextfield(
                      controller: _phoneController,
                      textInputType: TextInputType.phone,
                      labelText: "1234567890"),
                  MembershipBuildTextfield(
                      controller: _birthDateController,
                      textInputType: TextInputType.datetime,
                      labelText: "01/01/1998"),
                ],
              ),
              const SizedBox(height: 16.0),
              Container(
                margin: EdgeInsets.only(top: 100),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CustomButton(onTap: () {}, text: "Kaydet"),
                ),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Hesabımı Kapat',
                  style: Constant.font1.copyWith(
                      decoration: TextDecoration.underline,
                      color: Constant.lightPurple),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MembershipBuildTextfield extends StatelessWidget {
  const MembershipBuildTextfield({
    Key? key,
    required this.labelText,
    required this.textInputType,
    required this.controller,
  }) : super(key: key);

  final String labelText;
  final TextInputType textInputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Constant.white),
        keyboardType: textInputType,
        cursorColor: Constant.whitePurple,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Constant.ptSansBold
              .copyWith(color: Constant.lightPurple.withOpacity(0.8)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Constant.nightAmber.withOpacity(0.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Constant.whitePurple.withOpacity(0.5)),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        ),
      ),
    );
  }
}
