import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/screens/auth_checker.dart';
import 'package:prototip/view/base_scaffold.dart';
import 'package:prototip/view/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}
//riverpod kullanılması için ProvidersScope ile sarmalanması gerekli

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Ticaret Uygulaması',
      initialRoute: "/",
      routes: {
        "/": (context) => const Splash(),
        "/baseScaffold": (context) => BaseScaffold(),
        "/authChecker": (context) => const AuthChecker()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Constant.darkGrey),
    );
  }
}
