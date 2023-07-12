import 'package:flutter/material.dart';

import '../pages/general/shopping_cart_page.dart';

class ShoppingCartAppBarWidgets extends StatefulWidget {
  const ShoppingCartAppBarWidgets({super.key});

  @override
  State<ShoppingCartAppBarWidgets> createState() => _ShoppingCartAppBarWidgetsState();
}

class _ShoppingCartAppBarWidgetsState extends State<ShoppingCartAppBarWidgets> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: Row(
        children: [
          const SizedBox(width: 15,),
          const Icon(Icons.add_shopping_cart_sharp,size: 23,),
          const SizedBox(width: 7,),
          const Text('4 Items',style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),),
          Expanded(child: Container()),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffdf0100),
              elevation: 0,
            ),

            onPressed: () {

            },
            icon: const Icon(
              Icons.close_outlined,
              size: 22.0,
            ),
            label: const Text('Close',style: TextStyle(fontSize: 16),), // <-- Text
          ),
        ],
      ),
    );
  }
}

