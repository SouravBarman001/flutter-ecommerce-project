import 'package:flutter/material.dart';
class ListViewItems extends StatelessWidget {
  final List<String> productsImages;
  final int index;
  const ListViewItems({
    super.key,
    required this.productsImages, required this.index,
  });



  @override
  Widget build(BuildContext context) {
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
  }
}