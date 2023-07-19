import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/pages/dummy/repository_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/cart_controller.dart';
import '../../database_helper/db_helper.dart';
import '../../model/cart_model.dart';
import '../../model/featured_product_model.dart';

class ReusableListViewItemContainer extends StatelessWidget {
  const ReusableListViewItemContainer({
    super.key,
    required this.featuredProduct, required this.index,
  });

  final RepositoryData featuredProduct;
  final int index;


  @override
  Widget build(BuildContext context) {
    final cart  = Provider.of<CartProvider>(context);
    DBHelper? dbHelper = DBHelper();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      margin: const EdgeInsets.only(top: 4, right: 18),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            width: 150,
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: featuredProduct.imageUrl.toString(),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  featuredProduct.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    text: 'BDT-${featuredProduct.price}',
                    style:
                    const TextStyle(fontSize: 15, color: Colors.black),
                    children: const [
                      WidgetSpan(
                        child: SizedBox(
                          width: 10,
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {

              print(index);
              print(featuredProduct.name);
              print(featuredProduct.price);
              print(featuredProduct.imageUrl);


              dbHelper!.insert(
                  Cart(
                      id: index,
                      productName: featuredProduct.name.toString(),
                      initialPrice: featuredProduct.price,
                      productPrice: featuredProduct.price,
                      quantity: 1,
                      unitTag: '\$',
                      image: featuredProduct.imageUrl.toString())
              ).then((value){

                cart.addTotalPrice(double.parse(featuredProduct.price.toString()));
                cart.addCounter();

                const snackBar = SnackBar(backgroundColor: Colors.green,content: Text('Product is added to cart'), duration: Duration(seconds: 1),);

                ScaffoldMessenger.of(context).showSnackBar(snackBar);

              }).onError((error, stackTrace){
                print("error$error");
                const snackBar = SnackBar(backgroundColor: Colors.red ,content: Text('Product is already added in cart'), duration: Duration(seconds: 1));

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });

















            },
            icon: const Icon(Icons.add_shopping_cart_outlined),
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}


