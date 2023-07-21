import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerceapp/Repositories/local_home_repository.dart';
import 'package:ecommerceapp/Repositories/remote_home_repository.dart';
import 'package:ecommerceapp/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/dummy/check_internet_from_otherclass.dart';
import '../widgets/snackbar_widgets.dart';

enum NetworkStatus { online, offline }

class NetworkService extends ChangeNotifier{
  var networkStatus = 'online';
  StreamController<NetworkStatus> controller = StreamController();

  NetworkService() {
    Connectivity().onConnectivityChanged.listen((event) {
      controller.add(_networkStatus(event));
      _showSnackBar(_networkStatus(event)); // Show the snackbar when network status changes
    });
  }

  NetworkStatus _networkStatus(ConnectivityResult connectivityResult) {
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi
        ? NetworkStatus.online
        : NetworkStatus.offline;
  }

  void _showSnackBar(NetworkStatus status) {
    String message;
    Color backgroundColor;

    switch (status) {
      case NetworkStatus.online:

        HomePageController homePageController = HomePageController();

        /// This objects are used for banner
        homePageController.homeRepo = RemoteHomeRepo();
        homePageController.homeRepo.fetchBanner();

        /// This objects are used for featured product
        homePageController.homeRepoFeaturedProduct = RemoteHomeRepo();
        homePageController.homeRepoFeaturedProduct.fetchFeaturedProduct();
        SnackBarWidgets snackBarWidgets = SnackBarWidgets();
        snackBarWidgets.getXSnackBar('You are in Online');
     //   networkStatus = 'online';
        notifyListeners();
        //OtherClassOne.onlineMode();
        break;
      case NetworkStatus.offline:

       // networkStatus = 'offline';
        HomePageController homePageController2 = HomePageController();
        homePageController2.homeRepo = LocalHomeRepo();
        homePageController2.homeRepo.fetchBanner();

        /// This objects are used for featured product
        homePageController2.homeRepoFeaturedProduct = LocalHomeRepo();
        homePageController2.homeRepoFeaturedProduct.fetchFeaturedProduct();
        SnackBarWidgets snackBarWidgets = SnackBarWidgets();
        snackBarWidgets.getXSnackBar('Offline, Please check your internet');
        notifyListeners();
       // OtherClassOne.offlineMode();
        break;
    }
  }
}
