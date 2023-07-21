import 'package:ecommerceapp/Repositories/interface_/home_repo_banner_interface.dart';
import 'package:ecommerceapp/pages/general/shopping_cart_page.dart';

import '../Repositories/interface_/home_repo_featured_product_interface.dart';
import '../pages/locator.dart';
import '../services/navigation_services.dart';

class HomePageController{
  final NavigationServices navigationServices = locator<NavigationServices>();

   void goToShoppingCart(){
    navigationServices.navigateTo(ShoppingCartPage.id);
  }


 late HomeRepo homeRepo;
 late HomeRepoFeaturedProduct homeRepoFeaturedProduct;


}