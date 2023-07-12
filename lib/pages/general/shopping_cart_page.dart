import 'package:flutter/material.dart';
import '../../widgets/content/add_banner_cart_page.dart';
import '../../widgets/shopping_cart_app_bar_widget.dart';



class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
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
            elevation: 0.5,
            backgroundColor: const Color(0xffdf0100),
            actions: const [
              ShoppingCartAppBarWidgets(),
            ],
          ),
          body:   const SafeArea(
            child:SingleChildScrollView(
              child: Column(

                children: [
                 AddBanner(),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
