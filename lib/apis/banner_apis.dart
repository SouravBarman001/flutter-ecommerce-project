import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/banner_model.dart';

class BannerApis {

  static List<BannerModel> photoList=[];
  static Future<List<BannerModel>> fetchImages() async {
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
      photoList = sliders.map<BannerModel>((slider) {
        return BannerModel(imageUrl: slider['ImageUrl']);
      }).toList();

      print('images added to list.....................................');
      return photoList;
    } else {
      throw Exception('Failed to fetch images');
    }
  }



}
