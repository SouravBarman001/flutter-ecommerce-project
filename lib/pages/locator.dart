
import 'package:ecommerceapp/services/navigation_services.dart';
import 'package:get_it/get_it.dart';

import '../services/scrollview_controller_services.dart';

GetIt locator = GetIt.instance;
void setupLocator(){
  locator.registerLazySingleton(() => NavigationServices());
  locator.registerLazySingleton(() => ScrollViewControllerService());

}