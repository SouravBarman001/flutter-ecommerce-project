import 'package:flutter/material.dart';
import '../../widgets/components/add_banner_cart_page.dart';
import '../../widgets/components/user_cart_bottom_section.dart';
import '../../widgets/shopping_cart_app_bar_widget.dart';
import '../../widgets/user_cart_items_widgets.dart';
import '../locator.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});
  static const String id = 'cart';
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
                const SizedBox(
                  height: 10,
                ),
                const UserCardBottomSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


