import 'package:ecommerceapp/apis/banner_apis.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbar_action_widgets.dart';
import '../../widgets/best_seller.dart';
import '../../widgets/category_product.dart';
import '../../widgets/featured_products.dart';
import '../../widgets/happy_hour.dart';
import '../../widgets/slider_widgets.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: ()=> FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            elevation: 3,
            backgroundColor: const Color(0xffdf0100),
            actions: const [
              AppBarActionWidgets(),
            ],
          ),
          body:  const SafeArea(
            child:SingleChildScrollView(
              child: Column(
                children: [
                  SliderWidgets(),
                  SizedBox(height: 10,),
                  HappyHourTime(),
                  SizedBox(height: 5,),
                  // Bestsellers
                  BestSeller(),
                  SizedBox(height: 5,),
                  // category products
                  CategoryProduct(),
                  SizedBox(height: 5,),
                  // Featured products
                  FeaturedProducts(),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
