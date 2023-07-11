import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 5,
                ),
                onPressed: () {
                  // Add your onPressed function here
                },
                child: const Text(
                  'Best Seller',
                  style: TextStyle(color: Colors.black),
                ),
              ),
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
                    margin: const EdgeInsets.only(top: 4,right: 18),
                    // color: Colors.grey,
                    width: 150,
                    // height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 120,
                          width: 150,
                          child: ClipRRect(
                            // borderRadius: BorderRadius.circular(10), // Adjust the radius value as per your preference
                            child: Image.asset(
                              productsImages[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('1-3 hours Delivery'),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text('Mango'),
                              const SizedBox(
                                height: 4,
                              ),
                              RichText(
                                  text: const TextSpan(
                                      text: 'BDT-70',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                      children: [
                                    WidgetSpan(
                                      child: SizedBox(
                                          width:
                                              10), // Adjust the width as needed for the desired spacing
                                    ),
                                    TextSpan(
                                        text: 'Per KG',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))
                                  ])),
                            ],
                          ),
                        ),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.add_shopping_cart_outlined),color: Colors.redAccent,),
                      ],
                    ),
                  );

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
