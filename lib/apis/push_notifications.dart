import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotification{


  static FirebaseMessaging fMessaging = FirebaseMessaging.instance;

  // of getting firebase messaging  token
 static Future<void> getFirebaseMsgtoken() async{
   await fMessaging.requestPermission();

   await fMessaging.getToken().then((value){
     if(value !=null){
       print('token : $value');
     }
   });
 }


}