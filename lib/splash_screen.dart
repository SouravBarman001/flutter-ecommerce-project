import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerceapp/pages/auth/login_page.dart';
import 'package:ecommerceapp/pages/general/home_page.dart';
import 'package:ecommerceapp/pages/locator.dart';
import 'package:ecommerceapp/services/navigation_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    Timer(const Duration(seconds: 3), () {
      SplashScreenController().checkUserCredentials().then((login) {
        if (login) {
          locator<NavigationServices>().navigateTo(HomePage.id);
        } else {
          locator<NavigationServices>().navigateTo(LoginPage.id);
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Center(
          child:Image.asset( 'images/splash/two.gif',width: 300,height: 300,),
        ),
      ),
    );
  }
}