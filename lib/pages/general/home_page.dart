import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import '../../apis/push_notifications.dart';
import '../../widgets/appbar_action_widgets.dart';
import '../../widgets/best_seller.dart';
import '../../widgets/category_product.dart';
import '../../widgets/components/side_nav_drawer.dart';
import '../../widgets/featured_products.dart';
import '../../widgets/happy_hour.dart';
import '../../widgets/slider_widgets.dart';
import '../dummy/dummy_api_call.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String id = 'home';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PushNotification.getFirebaseMsgtoken();

  }

  // Future<List<RepositoryData>> apiCall() async {
  //   DummyApiCall dummyApiCall = DummyApiCall();
  //   await dummyApiCall.insertDataToHive();
  //   return DummyApiCall.repositoryList;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdvancedDrawer(
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.red, Colors.blueGrey.withOpacity(0.5)],
            ),
          ),
        ),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 0.0,
          //   ),
          // ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer: const SideNavDrawer(),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              // title: const Text('Advanced Drawer Example'),
              leading: IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Icon(
                        value.visible ? Icons.clear : Icons.menu,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
              elevation: 3,
              backgroundColor: const Color(0xffdf0100),
              actions: const [
                AppBarActionWidgets(),
              ],
            ),
            body: const SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SliderWidgets(),
                    SizedBox(
                      height: 10,
                    ),
                    FeaturedProducts(),
                    SizedBox(
                      height: 10,
                    ),

                    HappyHourTime(),
                    SizedBox(
                      height: 5,
                    ),
                   // Bestsellers
                    BestSeller(),
                    SizedBox(
                      height: 5,
                    ),
                    // category products
                    CategoryProduct(),
                    SizedBox(
                      height: 15,
                    ),
                  // Featured products
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}




