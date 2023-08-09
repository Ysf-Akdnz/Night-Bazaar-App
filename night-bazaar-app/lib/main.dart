import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/view/main-screen.dart';
import 'package:prototip/view/splash.dart';

void main() => runApp(const ProviderScope(child: MyApp()));
//riverpod kullanılması için ProvidersScope ile sarmalanması gerekli

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Ticaret Uygulaması',
      initialRoute: "/",
      routes: {
        "/": (context) => Splash(),
        "/mainScreen": (context) => const MainScreen(),
      },
      debugShowCheckedModeBanner: false,
      //navigatorKey: Grock.navigationKey, //Sayfa geçiş işlemlerinde kullanılacak
      //scaffoldMessengerKey:
      //    Grock.scaffoldMessengerKey, //Bildirimleri göstermek için kullanılacak
      theme: ThemeData(scaffoldBackgroundColor: Constant.darkGrey),
    );
  }
}
