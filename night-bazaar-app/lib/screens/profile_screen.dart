import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prototip/model/account/loginSignup/splash_access_model.dart';
import 'package:prototip/model/account/profile/profile_model.dart';
import 'package:prototip/providers/auth_service.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

// Buraya tekrar gel.
class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  AuthService authService = AuthService();
  Widget? profileWidget;

  @override
  void initState() {
    super.initState();
    _checkLoggedInStatus();
  }

  Future<void> _checkLoggedInStatus() async {
    bool isLoggedIn = await authService.isUserLoggedIn();
    setState(() {
      if (isLoggedIn) {
        profileWidget = const ProfileModel();
      } else {
        profileWidget = const SplashAccess();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profileWidget,
    );
  }
}
