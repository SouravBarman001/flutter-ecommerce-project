

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

import '../../hivedb/boxs.dart';
import '../../hivedb/f_product.dart';
import '../../hivedb/repository_data.dart';

class DummyApiCall{

  static List<RepositoryData> repositoryList =[];
  //var hiveBox = Boxes.getData();
   var products = [];


  Future<List<RepositoryData>> apiCall() async {
    DummyApiCall dummyApiCall = DummyApiCall();
    print('inside apiCall');
    await dummyApiCall.insertDataToHive();
    return DummyApiCall.repositoryList;
  }

   Future<void> insertDataToHive() async {

    try{

      final response = await http.get(
        Uri.parse('https://demo460.nop-station.com/api/home/featureproducts'),
        headers: {
          'Content-Type': 'application/json',
          'DeviceId': '44b4d8cd-7a2d-4a5f-a0e2-798021f1e294',
        },
      );

      if (response.statusCode == 200) {
        print('Inside 200 of in dummy api call');
        final data = jsonDecode(response.body.toString());
         products = data['Data'];

        print('all featured products $data');

        if (Boxes.getData()!.isOpen!) {
          print('Box is open');

          await putData(products);


        }else{
          // final data = Product(name: 'Failed', price: 00.00, imageUrl: 'Failed');
          // box.add(data);
          print('value con not add to the box');
        }


      } else {
        throw Exception('Failed to fetch images');
      }

    }catch(socketException){
       print('No Internet $socketException');
    }

    // Getting data from box and save to repository
    var myData = Boxes.getData().values.toList().cast<FProduct>();
    if(myData.isEmpty){
      print('Box is empty');
    }else{
      for (final product in myData) {
        print("Adding data to my repository");
        print(product.name);
        print(product.price);
        print(product.imageUrl);
        repositoryList.add(RepositoryData(name: product.name, price: product.price, imageUrl: product.imageUrl));
      }

    }




  }

   Future putData(products) async{
      await Boxes.getData()?.clear();
     for (final product in products) {
       String name = product['Name'];
       double price = product['ProductPrice']['PriceValue'];
       String imageUrl = product['PictureModels'][0]['ImageUrl'];
       print('added to the list of featuredproducts');
       final data = FProduct(name: name, price: price, imageUrl: imageUrl);
       print('adding value to box');
       Boxes.getData()?.add(data);
     }
   }

   Future<void> updateData() async{

    try{

      final response = await http.get(
        Uri.parse('https://demo460.nop-station.com/api/home/featureproducts'),
        headers: {
          'Content-Type': 'application/json',
          'DeviceId': '44b4d8cd-7a2d-4a5f-a0e2-798021f1e294',
        },
      );

      if (response.statusCode == 200) {
        print('Inside 200 of featured product');
        final data = jsonDecode(response.body.toString());
        products = data['Data'];

        print('all featured products $products');
        if (Boxes.getData().isOpen) {
          print('Box is open');

          await putData(products);

        }else{
          // final data = Product(name: 'Failed', price: 00.00, imageUrl: 'Failed');
          // hiveBox.add(data);
          print('value con not add to the box');
        }


      } else {
        throw Exception('Failed to fetch images');
      }

    }catch(socketException){
      Fluttertoast.showToast(
          msg: "Please! Check your internet connection",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

}
