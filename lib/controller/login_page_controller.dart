import 'package:ecommerceapp/services/navigation_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../apis/login_apis.dart';
import '../pages/general/home_page.dart';
import '../pages/locator.dart';

class LoginPageController extends ChangeNotifier {


  final NavigationServices navigationServices = locator<NavigationServices>();


  Future<void> userLogin(String emailController, String passController) async {
    bool loggedIn = await LoginApis.loginPerform(emailController, passController);
    if (loggedIn) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('YesLogin', true);
      print(' shared preference set check : ${prefs.getBool('YesLogin')}');
      print('Login Successfully');
      navigateToHomePage();

      // notifyListeners();
    }
  }

  void navigateToHomePage() {
    navigationServices.navigateTo(HomePage.id);
  }
}