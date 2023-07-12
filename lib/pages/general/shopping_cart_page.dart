import 'package:flutter/material.dart';
import '../../widgets/content/add_banner_cart_page.dart';
import '../../widgets/shopping_cart_app_bar_widget.dart';
import '../../widgets/user_cart_items_widgets.dart';

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
        onTap: () => _unfocusKeyboard(),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.5,
            backgroundColor: const Color(0xffdf0100),
            actions: const [
              ShoppingCartAppBarWidgets(),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                const AddBanner(),
                 Expanded(
                  flex: 2,
                  child: Container(
                   // color: Colors.cyan,
                    child: const SingleChildScrollView(
                      child: Column(
                        children: [
                          UserCardItems(),
                          UserCardItems(),
                          UserCardItems(),
                          UserCardItems(),
                          UserCardItems(),
                          UserCardItems(),
                          UserCardItems(),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Expanded(
                  flex: 1,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15,top: 12),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('- 10% Discount on sub totals',style: TextStyle(color: Colors.blue,fontSize:15,fontWeight: FontWeight.w500 ),),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor : const Color(0xffdbf6e4),
                                    ),
                                    onPressed: (){}, child: const Text('Apply',style: TextStyle(color: Colors.black54),),),
                                ],
                              ),
                              const Row(
                                children: [
                                  Text('Show more discounts',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 15),),
                                  Icon(Icons.arrow_drop_down_sharp),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          height: 15,
                          thickness: 0.1,
                         // indent: 5,
                         // endIndent: 5,
                        ),

                      ],
                    ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
