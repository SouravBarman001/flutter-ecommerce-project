import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../apis/featured_products_apis.dart';
import '../controller/cart_controller.dart';
import '../model/featured_product_model.dart';
import '../pages/locator.dart';
import '../services/scrollview_controller_services.dart';
import 'components/reusable_listview_items_container.dart';
class FeaturedProducts extends StatefulWidget {
  const FeaturedProducts({super.key});

  @override
  State<FeaturedProducts> createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FeaturedProductApis.fetchFeaturedProductsData();
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
                  backgroundColor:Colors.red.shade400,
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
              TextButton(onPressed: (){}, child: const Text('More',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),)),
            ],
          ),
          Container(
            color: const Color(0xfffafafa),
            height: 250,
            child: FutureBuilder<List<FeaturedProduct>>(
              future: FeaturedProductApis.fetchFeaturedProductsData(),
              builder: (context, AsyncSnapshot<List<FeaturedProduct>> snapshot) {
                if (snapshot.hasData) {
                  final productsImages = snapshot.data!;

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productsImages.length,
                    itemBuilder: (context, index) {
                      final featuredProduct = productsImages[index];

                      return ReusableListViewItemContainer(featuredProduct: featuredProduct, index: index,);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const Center(child: RefreshProgressIndicator());
                }
              },
            ),
          ),


          const SizedBox(height: 10,),


        ],
      ),

    );

  }


}
