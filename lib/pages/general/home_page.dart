import 'package:flutter/material.dart';

import '../../widgets/appbar_action_widgets.dart';
import '../../widgets/best_seller.dart';
import '../../widgets/featured_products.dart';
import '../../widgets/happy_hour.dart';
import '../../widgets/slider_widgets.dart';
import '../../widgets/content/count_down_timer.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose(); // Dispose the focus node to avoid memory leaks
    super.dispose();
  }
  void _unfocusKeyboard() {
    _focusNode.unfocus();
  }

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap:()=> _unfocusKeyboard(),
        child: Scaffold(
          appBar: AppBar(
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
                  // Featured products
                  FeaturedProducts(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
