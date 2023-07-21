

import '../../hivedb/repository_data.dart';

abstract class HomeRepoFeaturedProduct{

  Future<List<RepositoryData>> fetchFeaturedProduct();

}