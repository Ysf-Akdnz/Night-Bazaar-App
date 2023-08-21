import 'package:flutter/material.dart';
import 'package:prototip/model/account/profile/profile_model.dart';

import '../model/account/loginSignup/login_signup_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLogin ? const ProfileModel() : LoginSignupModel(),
    );
  }
}
