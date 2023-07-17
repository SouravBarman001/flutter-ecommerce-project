
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/controller/home_page_controller.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

import '../controller/cart_controller.dart';

class AppBarActionWidgets extends StatefulWidget {
  const AppBarActionWidgets({super.key});

  @override
  State<AppBarActionWidgets> createState() => _AppBarActionWidgetsState();
}

class _AppBarActionWidgetsState extends State<AppBarActionWidgets> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {

    return   Expanded(
      child: Row(
        children: [

          const SizedBox(width: 48,),
          Consumer<CartProvider>(
            builder: (context, value , child){
              return InkWell(
                onTap: (){

                  if(value.getCounter() == 0 ){

                  }else{
                    // Perform cart action
                    HomePageController homepageController = HomePageController();
                    homepageController.goToShoppingCart();
                  }

                },
                child:  Center(
                    child: badges.Badge(
                      badgeContent: Text(value.getCounter().toString(),style: const TextStyle(color: Colors.white)),

                      child: const Icon(Icons.shopping_cart_outlined),
                    )
                ),
              );
            },
          ),

          const SizedBox(width: 6,),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              // width: 20,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top:5,left: 5),
                  suffixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search your Products',
                  hintStyle: const TextStyle(
                      color: Colors.grey
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ),
            ),
          ),
          DropdownButton<String>(
            borderRadius: BorderRadius.circular(10),
            focusColor: const Color(0xffdf0100),
            dropdownColor: Colors.red,
            //menuMaxHeight:90.0,
            value: selectedOption,
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue;
              });
            },
            items: const <DropdownMenuItem<String>>[
              DropdownMenuItem<String>(
                value: 'Option 1',
                child: Text('BAN',style: TextStyle(color: Colors.white,fontSize: 15),),
              ),
              DropdownMenuItem<String>(
                value: 'Option 2',
                child: Text('ENG',style: TextStyle(color: Colors.white,fontSize: 15)),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Perform person action
            },
          ),
        ],
      ),
    );
  }
}

