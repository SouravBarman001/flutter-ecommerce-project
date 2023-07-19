import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../pages/auth/login_page.dart';
import '../pages/locator.dart';
import '../services/navigation_services.dart';

class LoginApis{
  static Future<bool> loginPerform(String email, String password) async {
    try {
      print(email);
      print(password);
      http.Response response = await http.post(
        Uri.parse('https://demo460.nop-station.com/api/customer/login'),
        headers: {
          'Content-Type': 'application/json',
          'DeviceId':'44b4d8cd-7a2d-4a5f-a0e2-798021f1e294'
        },
        body:json.encode({"Data": {
          "Email": email,
          "Password": password
        }}),

      );

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        var token = responseData['Data']['Token'];
        print('Login successful');
        print(responseData.toString());
        print('User Token : $token');
        return true;
      }
      else {
        print('Login failed');
        return false;

      }
    } catch (e) {
      print('Exception occurred: $e');
     // showSnakeBar(context,'Please check your internet connection');
    }
    return false;
  }


  static Future<UserCredential?> signInWithGoogle() async {

    try{
      print('inside auth');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }catch(e){
      print(e);
    }
    return null;
  }

  static void signOut() async{
    print('inside logout');
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut().then((value){
      locator<NavigationServices>().navigateTo(LoginPage.id);

    });
}


}