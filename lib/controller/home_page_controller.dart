import 'package:ecommerceapp/pages/general/shopping_cart_page.dart';

import '../pages/locator.dart';
import '../services/navigation_services.dart';

class HomePageController{
  final NavigationServices navigationServices = locator<NavigationServices>();

   void goToShoppingCart(){
    navigationServices.navigateTo(ShoppingCartPage.id);
  }

}