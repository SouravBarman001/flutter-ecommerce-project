import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarWidgets{

   static void showSnackBar(context,String data){
     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor:Colors.lightBlueAccent,
           content: Text(data.toString())),
     );
   }


    void getXSnackBar(String msg){

      Get.rawSnackbar(
        messageText:  Text(msg.toString()),
        isDismissible: true,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.cyan,
        snackStyle: SnackStyle.GROUNDED,
      );
   }

}