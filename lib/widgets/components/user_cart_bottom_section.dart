import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/cart_controller.dart';

class UserCardBottomSection extends StatefulWidget {
  const UserCardBottomSection({
    super.key
  });

  @override
  State<UserCardBottomSection> createState() => _UserCardBottomSectionState();
}

class _UserCardBottomSectionState extends State<UserCardBottomSection> {
  @override
  Widget build(BuildContext context) {
    //final accessCart  = context.read<CartProvider>();
    // final cart  = Provider.of<CartProvider>(context);


    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '- 10% Discount on sub totals',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xffdbf6e4),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Apply',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        'Show more discounts',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      Icon(Icons.arrow_drop_down_sharp),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 10,
            thickness: 0.1,
            // indent: 5,
            // endIndent: 5,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffdadada),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: -5.0,
                    blurRadius: 5,
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              //   color: Colors.red,
              //height: 15,
              width: double.infinity,
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        // labelText: 'Enter Name',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                    child: Container(
                      // padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: const Color(0xfffca15e),
                        borderRadius: BorderRadius.circular(8),
                      ),

                      child: const TextButton(
                        onPressed: null,
                        child: Text(
                          'Apply Coupon',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 5,
            thickness: 0.1,
            // indent: 5,
            // endIndent: 5,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffdadada),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: -5.0,
                    blurRadius: 5,
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              //   color: Colors.red,
              //height: 15,
              width: double.infinity,
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        // labelText: 'Enter Name',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                    child: Container(
                      // padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: const Color(0xff287ece),
                        borderRadius: BorderRadius.circular(8),
                      ),

                      child: const TextButton(
                        onPressed: null,
                        child: Text(
                          'Apply Loyalty',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 7,
            thickness: 0.1,
            // indent: 5,
            // endIndent: 5,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: double.infinity,
                    color: const Color(0xff9de6b4),
                    //  color: const Color(0xffdf0000),
                    child:  Consumer<CartProvider>(
                      builder: (context, value , child){
                        return Text('Total : \$ ${value.getTotalPrice().toStringAsFixed(2)}',style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),);
                      },
                    ),
                    //Text(
                    //   '',
                    //   style: const TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: double.infinity,
                    //color:const Color(0xff9de6b4) ,
                    color: const Color(0xffdf0000),
                    child: const Text(
                      'Place Order',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
