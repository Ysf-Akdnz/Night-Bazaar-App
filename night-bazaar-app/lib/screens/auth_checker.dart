import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prototip/providers/auth_providers.dart';
import 'package:prototip/screens/profile_screen.dart';
import 'package:prototip/view/base_scaffold.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
        data: (user) {
          if (user != null) return BaseScaffold();
          return BaseScaffold();
        },
        loading: () => const SplashLoading(),
        error: (error, stackTrace) => const ProfileScreen());
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
