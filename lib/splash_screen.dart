import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerceapp/pages/auth/login_page.dart';
import 'package:ecommerceapp/pages/general/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String id = '/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SplashScreenController>().checkLogin();
  }


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: AnimatedSplashScreen(
            splashIconSize: 200.0,
            splash: 'images/splash/two.gif',
             nextScreen:  context.read<SplashScreenController>().loginTrue == true ? const HomePage() : const LoginPage(),
           // nextScreen: const LoginPage(),
            splashTransition: SplashTransition.fadeTransition,
          ),
        ),
      ),
    );
  }
}
