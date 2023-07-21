import 'package:hive/hive.dart';
import '../pages/dummy/dummy_product.dart';
import 'f_product.dart';

class Boxes {
  //Hive.openBox<Product>('product')
  // await Hive.openBox<Product>('hive_box');
  static Box<FProduct> getData() => Hive.box<FProduct>('fbox');
  static Box<BannerModel> getBannerData() => Hive.box<BannerModel>('bannerbox');

}