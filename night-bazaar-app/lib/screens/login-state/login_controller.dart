import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prototip/providers/auth_providers.dart';
import 'package:prototip/screens/login-state/login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginStateInitial());

  final Ref ref;

  void login(String email, String password) async {
    state = const LoginStateLoading();
    try {
      await ref.read(authRepositoryProvider).signInWithEmailAndPassword(
            email,
            password,
          );
      state = const LoginStateSuccess();
    } catch (e) {
      state = LoginStateError(e.toString());
    }
  }

  void signOut() async {
    await ref.read(authRepositoryProvider).signOut();
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});
