import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/components/custom_buttons.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/account/loginSignup/components/build_textfield.dart';
import 'package:prototip/model/account/loginSignup/components/square_tile.dart';
import 'package:prototip/screens/login-state/login_controller.dart';
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
  final _loginEmailController = TextEditingController();
  final _loginPasswordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _signupEmailController = TextEditingController();
  final TextEditingController _signupPasswordController =
      TextEditingController();

  // sign user in method
  void signUserIn() {
    ref
        .read(loginControllerProvider.notifier)
        .login(_loginEmailController.text, _loginPasswordController.text);
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
      child: CustomButtonTwo(onTap: signUserIn, text: "RESGISTER NOW"),
    );
  }

  Column buildSignupSection() {
    return Column(
      children: [
        // username textfield
        BuildTextfield(
            controller: _userNameController,
            textInputType: TextInputType.name,
            isPasswordVisibile: false,
            icon: Assets.icons.profile,
            hintText: "User Name",
            isEmail: false,
            isPassword: false),
        BuildTextfield(
            controller: _signupEmailController,
            textInputType: TextInputType.text,
            isPasswordVisibile: false,
            icon: Assets.icons.email,
            hintText: "Email",
            isEmail: true,
            isPassword: false),
        BuildTextfield(
            controller: _signupPasswordController,
            textInputType: TextInputType.text,
            isPasswordVisibile: true,
            icon: Assets.icons.password,
            hintText: "Password",
            isEmail: false,
            isPassword: true),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMale = true;
                  });
                },
                child: Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          color:
                              isMale ? Constant.nightAmber : Colors.transparent,
                          border: Border.all(
                              width: 1, color: Constant.greyShade900),
                          borderRadius: BorderRadius.circular(15)),
                      child: SvgPicture.asset(Assets.icons.male,
                          color: isMale
                              ? Constant.greyShade900
                              : Constant.whitePurple.withOpacity(.65)),
                    ),
                    Text(
                      "Male",
                      style: Constant.ptSansBold.copyWith(
                          color: isMale
                              ? Constant.nightAmber
                              : Constant.whitePurple.withOpacity(0.65)),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 30),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMale = false;
                  });
                },
                child: Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          color: !isMale
                              ? Constant.nightAmber
                              : Colors.transparent,
                          border: Border.all(
                              width: 1, color: Constant.greyShade900),
                          borderRadius: BorderRadius.circular(15)),
                      child: SvgPicture.asset(
                        Assets.icons.female,
                        color: !isMale
                            ? Constant.greyShade900
                            : Constant.whitePurple.withOpacity(.65),
                      ),
                    ),
                    Text(
                      "Female",
                      style: Constant.ptSansBold.copyWith(
                          color: !isMale
                              ? Constant.nightAmber
                              : Constant.whitePurple.withOpacity(0.65)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
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
