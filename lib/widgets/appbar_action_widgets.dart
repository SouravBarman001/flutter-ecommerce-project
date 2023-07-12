import 'package:flutter/material.dart';

import '../pages/general/shopping_cart_page.dart';

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
          IconButton(onPressed: (){}, icon: const Icon(Icons.menu),),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Perform cart action
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const ShoppingCartPage()));
            },
          ),
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

