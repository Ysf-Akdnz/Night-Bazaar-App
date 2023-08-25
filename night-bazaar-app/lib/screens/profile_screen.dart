import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prototip/model/account/profile/profile_model.dart';
import 'package:prototip/providers/auth_providers.dart';
import 'package:prototip/screens/home_screen.dart';

import '../model/account/loginSignup/login_signup_model.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

// Buraya tekrar gel.
class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool isLogin = true;

  void updateIsLogin() {
    final authState = ref.read(authStateProvider);
    return authState.when(
        data: (user) {
          if (user != null) {
            isLogin = true;
          } else {
            isLogin = false;
          }
        },
        error: (error, stackTrace) => const HomeScreen(),
        loading: () => const SplashLoading());
  }

  @override
  void initState() {
    super.initState();
    updateIsLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLogin ? const ProfileModel() : LoginSignupModel(),
    );
  }
}

class SplashLoading extends StatelessWidget {
  const SplashLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
