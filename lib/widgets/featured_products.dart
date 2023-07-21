import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Repositories/local_home_repository.dart';
import '../Repositories/remote_home_repository.dart';
import '../hivedb/repository_data.dart';
import '../pages/dummy/dummy_api_call.dart';
import '../services/network_services.dart';
import 'components/reusable_listview_items_container.dart';

class FeaturedProducts extends StatefulWidget {
  const FeaturedProducts({super.key});

  @override
  State<FeaturedProducts> createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  late Future<List<RepositoryData>> _repositoryListFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // FeaturedProductApis.fetchFeaturedProductsData();
    _repositoryListFuture = DummyApiCall().apiCall();
  }

  int currentIndex = 0;
  // List <String> productsImages = [
  //   'images/featuredproducts/f1.webp',
  //   'images/featuredproducts/f2.webp',
  //   'images/featuredproducts/f3.webp',
  //   'images/featuredproducts/f4.webp',
  // ];
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    //  DummyApiCall dummyApiCall = DummyApiCall();

    var netStatus = Provider.of<NetworkStatus>(context);
    //HomePageController homePageController = HomePageController();
    // HomePageController homePageController = HomePageController();
    // homePageController.homeRepoFeaturedProduct = LocalHomeRepo();

    RemoteHomeRepo remoteHomeRepo = RemoteHomeRepo();
    LocalHomeRepo localHomeRepo = LocalHomeRepo();

    return Container(
      padding: const EdgeInsets.only(
        left: 12,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                  elevation: 2,
                ),
                onPressed: () {
                  // Add your onPressed function here
                },
                child: const Text(
                  'Featured Products',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'More',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w700),
                  )),
            ],
          ),

          Container( // netStatus == NetworkStatus.offline  //  remoteHomeRepo.fetchFeaturedProduct() //
              color: const Color(0xfffafafa),
              height: 250,
              child: FutureBuilder<List<RepositoryData>>(
                      future: netStatus == NetworkStatus.online ? remoteHomeRepo.fetchFeaturedProduct() : localHomeRepo.fetchFeaturedProduct(),
                      builder: (context,
                          AsyncSnapshot<List<RepositoryData>> snapshot) {
                        if (snapshot.hasData) {
                          final repositoryList = snapshot.data!;

                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: repositoryList.length,
                            itemBuilder: (context, index) {
                              final featuredProduct = repositoryList[index];

                              return ReusableListViewItemContainer(
                                featuredProduct: featuredProduct,
                                index: index,
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Image.asset(
                            netStatus == NetworkStatus.online ? 'no_connection_featured_product.jpg'  : 'images/ No_Product_Found.png',
                            fit: BoxFit.contain,
                          );
                        } else {
                          return const Center(
                              child: RefreshProgressIndicator());
                        }
                      },
                    ),

                   ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
