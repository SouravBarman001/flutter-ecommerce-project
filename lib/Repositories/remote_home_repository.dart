
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:ecommerceapp/hivedb/f_product.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerceapp/Repositories/interface_/home_repo_banner_interface.dart';
import '../hivedb/boxs.dart';
import '../hivedb/repository_data.dart';
import '../model/banner_model_repo_offline.dart';
import 'interface_/home_repo_featured_product_interface.dart';
import 'local_home_repository.dart';

 class RemoteHomeRepo implements HomeRepo,HomeRepoFeaturedProduct{

   /// This list is to store banner image url
  static List<BannerModelOffline> photoList=[];

  /// this list is to store featured product data
  static List<RepositoryData> repositoryList =[];
  LocalHomeRepo localHomeRepo = LocalHomeRepo();


  @override
   Future<List<BannerModelOffline>> fetchBanner() async {

    try{
      final response = await http.get(
        Uri.parse('https://demo460.nop-station.com/api/slider/homepageslider'),
        headers: {
          'Content-Type': 'application/json',
          'DeviceId': '44b4d8cd-7a2d-4a5f-a0e2-798021f1e294'
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());
        final sliders = data['Data']['Sliders'];

        print('inside 200.....................................');
        photoList = sliders.map<BannerModelOffline>((slider) {
          return BannerModelOffline(imageUrl: slider['ImageUrl']);
        }).toList();


        //products = data['Data'];
        // print('all featured products $products');

        if (Boxes.getData().isOpen) {
          print('Box is open');

          await putData(sliders);

        }else{
          // final data = Product(name: 'Failed', price: 00.00, imageUrl: 'Failed');
          // hiveBox.add(data);
          print('value con not add to the box');
        }

        print('images added to list.....................................');
        return photoList;
      } else {
        throw Exception('Failed to fetch images'
        );
      }
    }catch(SocketException){
      throw localHomeRepo.fetchBanner();
    }



  }


  // Insert data to the Hive Box
  Future putData(products) async{
    await Boxes.getBannerData()?.clear();
    for (final product in products) {
      String imageUrl = product['ImageUrl'];
      print('added image to hive');
      final data = BannerModel(imageUrl:imageUrl);
      print('adding value to box');
      Boxes.getBannerData()?.add(data);
    }
  }


  /// When the App become online, then it calls fetchFeaturedProduct() and fetch data directly from internet

  @override
  Future<List<RepositoryData>> fetchFeaturedProduct() async {

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
       final products = data['Data'];
       print('all featured products $products');
       repositoryList = products.map<RepositoryData>((product) {
         String name = product['Name'];
         double price = product['ProductPrice']['PriceValue'];
         String imageUrl = product['PictureModels'][0]['ImageUrl'];
         print('added to the list of featuredproducts');
         return RepositoryData(name: name, price: price, imageUrl: imageUrl);
       }).toList();

       /// Check the Hive Box open or not

       if (Boxes.getData()!.isOpen!) {
         print('featured box is opened');
         await putFeaturedData(products);
       }else{
         print('value con not add to the box');
       }

       return repositoryList;
     } else {
       throw Exception('Failed to fetch images');
     }


   }catch(SocketException){
     throw localHomeRepo.fetchFeaturedProduct();

   }


  }

  Future putFeaturedData(products) async{
    await Boxes.getData()?.clear();
    for (final product in products) {
      String name = product['Name'];
      double price = product['ProductPrice']['PriceValue'];
      String imageUrl = product['PictureModels'][0]['ImageUrl'];
      print('added to the list of featured products');
      final data = FProduct(name: name, price: price, imageUrl: imageUrl);
      print('adding value to featured box');
      Boxes.getData()?.add(data);
    }
  }


 }
