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
      saveUserCredentials(emailController,passController);
      print('Login Successfully');

    }
  }

   Future<void> saveUserCredentials(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    navigateToHomePage();
  }

  void navigateToHomePage() {
    navigationServices.navigateTo(HomePage.id);
  }
   void handleGoogleBtnClick(){
    LoginApis.signInWithGoogle().then((user) async {
      if(user != null){


        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', user.user.toString());
        await prefs.setString('password', user.additionalUserInfo.toString());


        print('\n ${user.user}');
        print('\n ${user.additionalUserInfo}');

        locator<NavigationServices>().navigateTo(HomePage.id);

      }
    } );
  }

}