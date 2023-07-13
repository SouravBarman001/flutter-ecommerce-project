import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerceapp/pages/auth/login_page.dart';
import 'package:ecommerceapp/pages/general/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool alreadyLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // checkLogin();
  }

  // Future<void> checkLogin() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var loginValue = prefs.getBool('YesLogin');
  //   if (loginValue != null && loginValue) {
  //     alreadyLogin = true;
  //     print(loginValue);
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: AnimatedSplashScreen(
            splashIconSize: 200.0,
            splash: 'images/splash/two.gif',
            // nextScreen: alreadyLogin == true ? const HomePage() : const LoginPage(),
            nextScreen: const LoginPage(),

            splashTransition: SplashTransition.fadeTransition,
          ),
        ),
      ),
    );
  }
}
