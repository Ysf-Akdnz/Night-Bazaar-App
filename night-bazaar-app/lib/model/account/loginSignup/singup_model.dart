import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/components/custom_buttons.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/account/loginSignup/components/build_textfield.dart';
import 'package:prototip/model/account/loginSignup/components/square_tile.dart';
import 'package:prototip/providers/auth_service.dart';
import 'package:prototip/utils/locator.dart';
import 'package:prototip/view/assets.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  bool isMale = true;
  bool isSignupScreen = false;
  bool isRememberMe = true;
  // text editing controllers
  final _tEmail = TextEditingController();
  final _tPassword = TextEditingController();
  final _tPasswordConfirmation = TextEditingController();

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
                "REGISTER NOW",
                textAlign: TextAlign.center,
                style: Constant.ptSansBold.copyWith(fontSize: 18),
              ),

              // logo
              const Icon(
                Icons.lock,
                size: 100,
                color: Constant.lightPurple,
              ),

              // You're welcome to Night Bazaar!
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "You're welcome to",
                  style: Constant.ptSansNormal.copyWith(
                      fontSize: 18, color: Colors.grey[700], letterSpacing: 1),
                  children: [
                    TextSpan(
                        text: " Night Bazaar",
                        style: GoogleFonts.caveat(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Constant.lightPurple)),
                  ],
                ),
              ),

              buildSignupSection(),

              // sign up button
              buildSignupButton(),

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
            ],
          ),
        ),
      ),
    );
  }

  Padding buildSignupButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: CustomButtonTwo(
        onTap: () {
          final email = _tEmail.text;
          final password = _tPassword.text;
          final confirmPassword = _tPasswordConfirmation.text;

          if (email.isEmpty & password.isEmpty & confirmPassword.isEmpty) {
            // Tüm alanlar boş ise hata mesajı
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Please fill in the fields."),
              ),
            );
          } else if (password.isEmpty || confirmPassword.isEmpty) {
            // Şifre alanları boş ise hata mesajı
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Password fields cannot be empty."),
              ),
            );
          } else if (password != confirmPassword) {
            // Şifreler eşleşmiyorsa hata mesajı
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Passwords do not match."),
              ),
            );
          } else {
            // Şifreler eşleşiyorsa kayıt işlemini tamamlayın
            locator.get<AuthService>().signUp(
                  email: _tEmail.text,
                  password: password,
                );
          }
        },
        text: "REGISTER NOW",
      ),
    );
  }

  Column buildSignupSection() {
    return Column(
      children: [
        BuildTextfield(
            controller: _tEmail,
            textInputType: TextInputType.text,
            isPasswordVisibile: false,
            icon: Assets.icons.email,
            hintText: "Email",
            isEmail: true,
            isPassword: false),
        BuildTextfield(
            controller: _tPassword,
            textInputType: TextInputType.text,
            isPasswordVisibile: true,
            icon: Assets.icons.password,
            hintText: "Password",
            isEmail: false,
            isPassword: true),
        BuildTextfield(
            controller: _tPasswordConfirmation,
            textInputType: TextInputType.text,
            isPasswordVisibile: true,
            icon: Assets.icons.password,
            hintText: "Confirm Password",
            isEmail: false,
            isPassword: true),
        Container(
          width: 200,
          margin: const EdgeInsets.only(top: 20),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "By pressing 'Submit' you agree to our",
                style: Constant.ptSansBold.copyWith(
                  color: Constant.lightPurple.withOpacity(.8),
                ),
                children: [
                  TextSpan(
                    text: " term & conditions",
                    style: Constant.ptSansBold
                        .copyWith(color: Constant.nightAmber),
                  )
                ]),
          ),
        )
      ],
    );
  }
}
