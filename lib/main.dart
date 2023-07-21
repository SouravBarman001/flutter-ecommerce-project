import 'package:ecommerceapp/pages/auth/login_page.dart';
import 'package:ecommerceapp/pages/dummy/check_connectivity.dart';
import 'package:ecommerceapp/pages/dummy/dummy_list_view.dart';
import 'package:ecommerceapp/pages/dummy/dummy_product.dart';
import 'package:ecommerceapp/hivedb/f_product.dart';
import 'package:ecommerceapp/pages/general/home_page.dart';
import 'package:ecommerceapp/pages/general/shopping_cart_page.dart';
import 'package:ecommerceapp/services/navigation_services.dart';
import 'package:ecommerceapp/services/network_services.dart';
import 'package:ecommerceapp/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'controller/cart_controller.dart';
import 'controller/login_page_controller.dart';
import 'controller/splash_screen_controller.dart';
import 'pages/locator.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory() ;
  Hive.init(directory.path);
  Hive.registerAdapter(FProductAdapter());
  Hive.registerAdapter(BannerModelAdapter());
  await Hive.openBox<FProduct>('fbox');
  await Hive.openBox<BannerModel>('bannerbox');

  await Firebase.initializeApp();
  setupLocator();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>NetworkService()),
        StreamProvider(create: (context)=>NetworkService().controller.stream, initialData: NetworkStatus.offline),
        ChangeNotifierProvider(create: (_)=>SplashScreenController()),
        ChangeNotifierProvider(create: (_)=>LoginPageController()),
        ChangeNotifierProvider(create: (_)=>CartProvider()),

      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationServices>().navigatorKey,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        HomePage.id: (context) => const HomePage(),
        LoginPage.id: (context) => const LoginPage(),
        ShoppingCartPage.id: (context) => const ShoppingCartPage(),
      },
    );
  }
}
