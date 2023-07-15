
import 'dart:convert';

import '../model/featured_product_model.dart';
import 'package:http/http.dart' as http;

class FeaturedProductApis{

  static List<FeaturedProduct> featuredProductList = [];

  static Future<List<FeaturedProduct>> fetchFeaturedProductsData() async {
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
      featuredProductList = products.map<FeaturedProduct>((product) {
        String name = product['Name'];
        double price = product['ProductPrice']['PriceValue'];
        String imageUrl = product['PictureModels'][0]['ImageUrl'];
         print('added to the list of featuredproducts');
        return FeaturedProduct(name: name, price: price, imageUrl: imageUrl);
      }).toList();

      return featuredProductList;
    } else {
      throw Exception('Failed to fetch images');
    }
  }

}