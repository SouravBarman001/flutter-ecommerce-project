import 'package:flutter/material.dart';

import 'components/list_view_items.dart';
class CategoryProduct extends StatefulWidget {
  const CategoryProduct({super.key});

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {

  int currentIndex = 0;
  List <String> productsImages = [
    'images/category/p1.jpg',
    'images/category/p2.jpg',
    'images/category/p3.jpg',
    'images/category/p4.jpg',

  ];

  List <String> productsName = [
    't-shirts',
    'SmartPhones',
    'Smart-TV',
    'Shoes',

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
                  elevation: 2,
                ),
                onPressed: () {
                  // Add your onPressed function here
                },
                child: const Text(
                  'Products category',
                  style: TextStyle(color: Colors.white
                  ),
                ),
              ),
              TextButton(onPressed: (){}, child: const Text('More',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),)),
            ],
          ),
          Container(
            //color: Colors.red,
            color: const Color(0xfffafafa),
            height: 250,
            child: ListView.builder(

              scrollDirection: Axis.horizontal,
              itemCount: productsImages.length,
              itemBuilder: (context, index) {
                return ListViewItems(productsImages: productsImages,index: index);

              },
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


