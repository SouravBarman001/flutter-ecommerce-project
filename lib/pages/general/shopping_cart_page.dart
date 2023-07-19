
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../controller/cart_controller.dart';
import '../../database_helper/db_helper.dart';
import '../../model/cart_model.dart';
import '../../widgets/components/add_banner_cart_page.dart';
import '../../widgets/components/user_cart_bottom_section.dart';
import '../../widgets/shopping_cart_app_bar_widget.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});
  static const String id = 'cart';
  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  final FocusNode _focusNode = FocusNode();
  DBHelper? dbHelper = DBHelper();
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
    final cart  = Provider.of<CartProvider>(context);

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
                  child: Column(
                    children: [
                      //UserCardItems(),

                      FutureBuilder<List<Cart>>(
                        future: cart.getData(),
                        builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                          if (snapshot.hasData) {
                            final sqlDataStored = snapshot.data!;

                            return SingleChildScrollView(
                              child: Container(
                              //  color: Colors.redAccent,
                                padding: const EdgeInsets.all(8),
                                height: 500,
                                child: ListView.builder(
                                  //scrollDirection: Axis.horizontal,
                                  itemCount: sqlDataStored.length,
                                  itemBuilder: (context, index) {
                                    final featuredProduct = sqlDataStored[index];

                                    return Column(
                                      children: [
                                        Material(
                                          elevation: 3,
                                          child: Container(

                                            //margin: const EdgeInsets.only(bottom: 7),
                                            // decoration: const BoxDecoration(
                                            // //  borderRadius: BorderRadius.circular(10),
                                            // ),
                                            // padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10,),
                                            height: 100,
                                            width: double.infinity,
                                            color: const Color(0xfffdfdfd),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                    onTap: () {

                                                    },
                                                    child: IconButton(
                                                      onPressed: () {
                                                        dbHelper!.delete(featuredProduct.id!);
                                                        cart.removerCounter();
                                                        cart.removeTotalPrice(double.parse(featuredProduct.productPrice.toString()));
                                                      },
                                                      icon: const Icon(
                                                        Icons.close_outlined,
                                                        color: Colors.red,
                                                      ),
                                                    )),
                                                ClipRRect(
                                                  child: CachedNetworkImage(
                                                    imageUrl: featuredProduct.image.toString(),
                                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                        Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                   Expanded(
                                                  flex: 2,
                                                    child: AutoSizeText(
                                                      featuredProduct.productName.toString(),
                                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                                    maxLines: 2,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 1,
                                                ),
                                                 Expanded(
                                                   flex: 1,
                                                    child: Text(
                                                      '${featuredProduct.unitTag.toString()}:${featuredProduct.initialPrice.toString()}',
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w500,
                                                          color: Colors.red),
                                                    ),),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  color: const Color(0xffecedef),
                                                  padding: const EdgeInsets.only(
                                                      left: 15, right: 15, top: 5, bottom: 5),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          int quantity = featuredProduct.quantity!;
                                                          double price = featuredProduct.initialPrice!;
                                                          quantity++;
                                                          double newPrice = price * quantity;

                                                          dbHelper!.updateQuantity(
                                                            Cart(
                                                              id: featuredProduct.id!,
                                                              productName: featuredProduct.productName!,
                                                              initialPrice: featuredProduct.initialPrice!,
                                                              productPrice: newPrice,
                                                              quantity: quantity,
                                                              unitTag: featuredProduct.unitTag.toString(),
                                                              image: featuredProduct.image.toString(),
                                                            ),
                                                          ).then((value) {
                                                            //cart.notifyListeners(); // Notify listeners of the change
                                                            newPrice = 0 ;
                                                            quantity = 0;
                                                            print('value plus------');

                                                            cart.addTotalPrice(double.parse(featuredProduct.initialPrice!.toString()));
                                                          }).onError((error, stackTrace) {
                                                            print(error.toString());
                                                          });
                                                        },
                                                        child: const Icon(Icons.add),
                                                      ),
                                                      Text(
                                                        featuredProduct.quantity.toString(),
                                                        style: const TextStyle(
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          int quantity = featuredProduct.quantity!;
                                                          double price = featuredProduct.initialPrice!;
                                                          quantity--;
                                                          double newPrice = price * quantity;

                                                          if (quantity > 0) {
                                                            dbHelper!.updateQuantity(
                                                              Cart(
                                                                id: featuredProduct.id!,
                                                                productName: featuredProduct.productName!,
                                                                initialPrice: featuredProduct.initialPrice!,
                                                                productPrice: newPrice,
                                                                quantity: quantity,
                                                                unitTag: featuredProduct.unitTag.toString(),
                                                                image: featuredProduct.image.toString(),
                                                              ),
                                                            ).then((value) {
                                                           //   cart.notifyListeners(); // Notify listeners of the change
                                                              newPrice = 0 ;
                                                              quantity = 0;
                                                              print('value minus------');
                                                              cart.removeTotalPrice(double.parse(featuredProduct.initialPrice!.toString()));
                                                            }).onError((error, stackTrace) {
                                                              print(error.toString());
                                                            });
                                                          }
                                                        },
                                                        child: const FaIcon(
                                                          FontAwesomeIcons.minus,
                                                          size: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 7,),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return const Center(child: RefreshProgressIndicator());
                          }
                        },
                      ),
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 5,
                // ),

            const UserCardBottomSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


