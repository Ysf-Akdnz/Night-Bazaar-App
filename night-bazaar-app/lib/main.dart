import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/account/loginSignup/login_model.dart';
import 'package:prototip/utils/locator.dart';
import 'package:prototip/view/base_scaffold.dart';
import 'package:prototip/view/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(const ProviderScope(child: MyApp()));
}
//riverpod kullanılması için ProvidersScope ile sarmalanması gerekli

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Ticaret Uygulaması',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Constant.darkGrey),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Splash();
            } else {
              return LoginSplash();
            }
          })),
    );
  }
}
