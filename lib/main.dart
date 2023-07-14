import 'package:ecommerceapp/pages/auth/login_page.dart';
import 'package:ecommerceapp/pages/general/home_page.dart';
import 'package:ecommerceapp/pages/general/shopping_cart_page.dart';
import 'package:ecommerceapp/services/navigation_services.dart';
import 'package:ecommerceapp/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/login_page_controller.dart';
import 'controller/splash_screen_controller.dart';
import 'pages/locator.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>SplashScreenController()),
        ChangeNotifierProvider(create: (_)=>LoginPageController()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationServices>().navigatorKey,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        HomePage.id: (context) => const HomePage(),
        LoginPage.id: (context) => const LoginPage(),
        ShoppingCartPage.id: (context) => const ShoppingCartPage(),
      },
    );
  }
}
