

import 'package:ecommerceapp/Repositories/interface_/home_repo_banner_interface.dart';
import 'package:ecommerceapp/hivedb/f_product.dart';
import '../hivedb/boxs.dart';
import '../hivedb/repository_data.dart';
import '../model/banner_model_repo_offline.dart';
import 'interface_/home_repo_featured_product_interface.dart';

class LocalHomeRepo implements HomeRepo,HomeRepoFeaturedProduct{

  /// This list is used for storing Banner image url
  static List<BannerModelOffline> photoList=[];

  /// This list is used for storing featured data url
  static List<RepositoryData> repositoryList =[];

  @override
  Future<List<BannerModelOffline>> fetchBanner() async{
    // TODO: implement fetchBanner

    var myData = Boxes.getBannerData().values.toList().cast<BannerModel>();
    if(myData.isEmpty){
      print('Banner Box is empty');
    }else{
      photoList.clear();
       for (final product in myData) {
        print("Adding data to my local repository photoList");
        print(product.imageUrl);
        photoList.add(BannerModelOffline(imageUrl: product.imageUrl));
      }
    }
    return photoList;
  }


  /// When internet connection is turned off, then it gets data from hive box

  @override
  Future<List<RepositoryData>> fetchFeaturedProduct() async{

    /// Getting data from box and save to repository
    var myData = Boxes.getData().values.toList().cast<FProduct>();
    if(myData.isEmpty){
      print('Featured Box is empty');
    }else{
      repositoryList.clear();
      for (final product in myData) {
        print("Adding data to my featured repository");
        print(product.name);
        print(product.price);
        print(product.imageUrl);
        repositoryList.add(RepositoryData(name: product.name, price: product.price, imageUrl: product.imageUrl));
      }
    }
    return repositoryList;
  }

}