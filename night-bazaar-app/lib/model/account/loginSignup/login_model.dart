import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:prototip/components/custom_buttons.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/account/loginSignup/components/build_textfield.dart';
import 'package:prototip/model/account/loginSignup/components/square_tile.dart';
import 'package:prototip/model/account/loginSignup/singup_model.dart';
import 'package:prototip/providers/auth_service.dart';
import 'package:prototip/utils/locator.dart';
import 'package:prototip/view/assets.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  // text editing controllers
  final _tEmail = TextEditingController();
  final _tPassword = TextEditingController();

  /*// sign user in method
  void signUserIn() {
    ref
        .read(loginControllerProvider.notifier)
        .login(_loginEmailController.text, _loginPasswordController.text);
  }*/

  void registerNow() {
    Get.to(() => const SignupPage(), transition: Transition.downToUp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "LOGIN",
                textAlign: TextAlign.center,
                style: Constant.ptSansBold.copyWith(fontSize: 18),
              ),
              // logo
              const Icon(
                Icons.lock,
                size: 100,
                color: Constant.lightPurple,
              ),
              // welcome back, you've been missed!
              Text(
                'Welcome back you\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              buildLoginSection(),

              // sign in button
              buildLoginButton(),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              // google + facebook sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  SquareTile(imagePath: Assets.images.google),

                  const SizedBox(width: 25),

                  // facebook button
                  SquareTile(imagePath: Assets.images.facebook)
                ],
              ),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: registerNow,
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: CustomButtonTwo(
          onTap: () {
            locator
                .get<AuthService>()
                .login(email: _tEmail.text, password: _tPassword.text);
          },
          text: "LOGIN"),
    );
  }

  Column buildLoginSection() {
    return Column(
      children: [
        // username textfield
        BuildTextfield(
            controller: _tEmail,
            textInputType: TextInputType.text,
            isPasswordVisibile: false,
            icon: Assets.icons.email,
            hintText: "info@gmail.com",
            isEmail: true,
            isPassword: false),

        // password textfield
        BuildTextfield(
            controller: _tPassword,
            textInputType: TextInputType.text,
            isPasswordVisibile: true,
            icon: Assets.icons.password,
            hintText: "***********",
            isEmail: false,
            isPassword: true),

        // forgot password?
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
