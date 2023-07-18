import 'package:ecommerceapp/pages/auth/login_page.dart';
import 'package:ecommerceapp/pages/general/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/locator.dart';
import '../services/navigation_services.dart';

class SplashScreenController extends ChangeNotifier{

  bool loginTrue = false;

  Future<void> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var loginValue = prefs.getBool('YesLogin');
    if (loginValue != null && loginValue) {
      loginTrue = true;
      navigationCheck(true);
      notifyListeners();
      print('inside notifier');
      //print('Shared Preference value : $loginValue');
    }

  }
  void navigationCheck(bool login){
    if(login){
      locator<NavigationServices>().navigateTo(HomePage.id);
    }else{
      locator<NavigationServices>().navigateTo(LoginPage.id);

    }
  }

}