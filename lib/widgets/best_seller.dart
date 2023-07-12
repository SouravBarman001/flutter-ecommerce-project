import 'package:flutter/material.dart';

import 'content/list_view_items.dart';
class BestSeller extends StatefulWidget {
  const BestSeller({super.key});

  @override
  State<BestSeller> createState() => _BestSellerState();
}

class _BestSellerState extends State<BestSeller> {

  int currentIndex = 0;
  List <String> productsImages = [
    'images/products/product1.jpeg',
    'images/products/product2.jpeg',
    'images/products/product3.webp',
    'images/products/product4.webp',
  ];
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
                  backgroundColor: Colors.red.shade400,
                  elevation: 3,
                ),
                onPressed: () {
                  // Add your onPressed function here
                },
                child: const Text(
                  'Best Seller',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(onPressed: (){}, child: const Text('More',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),)),
            ],
          ),
          Container(
            color: const Color(0xfffafafa),
            height: 250,
            child: RawScrollbar(
              controller: scrollController,
              thumbColor: Colors.redAccent,
              radius: const Radius.circular(8),
              crossAxisMargin: 2,
              child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemCount: productsImages.length,
                itemBuilder: (context, index) {
                  return ListViewItems(productsImages: productsImages,index: index,);

                },
              ),

            ),

          ),
          const SizedBox(height: 10,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     for(var i = 0;i<productsImages.length;i++)
          //       buildIndicator(currentIndex == i)
          //   ],
          // ),

        ],
      ),

    );

  }

  // Widget buildIndicator(bool isSelected){
  //   return Padding(
  //     padding: const EdgeInsets.only(right: 3),
  //     child: Container(
  //       height: isSelected ? 10 : 10,
  //       width: isSelected ? 10 : 10,
  //       decoration: BoxDecoration(
  //           shape: BoxShape.circle,
  //           color: isSelected ? const Color(0xffde0201) : const Color(0xffd9d9d9)
  //       ),
  //     ),
  //   );
  // }

}
