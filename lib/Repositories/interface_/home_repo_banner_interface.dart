


import '../../model/banner_model_repo_offline.dart';

abstract class HomeRepo{
  Future<List<BannerModelOffline>> fetchBanner();

}