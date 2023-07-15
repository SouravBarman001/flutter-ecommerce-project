import 'package:flutter/material.dart';

import '../../model/featured_product_model.dart';

class ReusableListViewItemContainer extends StatelessWidget {
  const ReusableListViewItemContainer({
    super.key,
    required this.featuredProduct,
  });

  final FeaturedProduct featuredProduct;

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
      margin: const EdgeInsets.only(top: 4, right: 18),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            width: 150,
            child: ClipRRect(
              child: Image.network(
                featuredProduct.imageUrl,
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
            onPressed: () {},
            icon: const Icon(Icons.add_shopping_cart_outlined),
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}


