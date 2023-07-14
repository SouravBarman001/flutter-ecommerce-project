import 'dart:convert';
import 'package:http/http.dart' as http;

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
}