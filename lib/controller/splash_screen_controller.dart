import 'package:ecommerceapp/pages/auth/login_page.dart';
import 'package:ecommerceapp/pages/general/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/locator.dart';
import '../services/navigation_services.dart';

class SplashScreenController extends ChangeNotifier{

  bool loginTrue = false;

  Future<bool> checkUserCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final password = prefs.getString('password');

    if(email != null && password != null){
      return true;
    }else{
      return false;

    }
  }

}