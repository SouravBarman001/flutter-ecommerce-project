import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import '../Repositories/local_home_repository.dart';
import '../Repositories/remote_home_repository.dart';
import '../apis/banner_apis.dart';
import '../controller/home_page_controller.dart';
import '../model/banner_model_repo_offline.dart';
import '../services/network_services.dart';

class SliderWidgets extends StatefulWidget {
  const SliderWidgets({super.key});

  @override
  State<SliderWidgets> createState() => _SliderWidgetsState();
}

class _SliderWidgetsState extends State<SliderWidgets> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    var netStatus = Provider.of<NetworkStatus>(context);
     HomePageController homePageController = HomePageController();
    RemoteHomeRepo remoteHomeRepo = RemoteHomeRepo();
    LocalHomeRepo localHomeRepo = LocalHomeRepo();


    return  Column(
              children: [
                SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: netStatus == NetworkStatus.online ?
                  FutureBuilder<List<BannerModelOffline>>(
                    future: remoteHomeRepo.fetchBanner(),
                    builder: (context, AsyncSnapshot<List<BannerModelOffline>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: RefreshProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Image.asset('images/no_net.jpg',fit: BoxFit.cover,);
                      } else {
                        return CarouselSlider(
                          options: CarouselOptions(
                            height: 400.0,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            initialPage: 0,
                            animateToClosest: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            pauseAutoPlayOnTouch: false,
                            aspectRatio: 16 / 9,
                            onPageChanged: (index, reason) {
                              // Do something when the page changes
                            },
                            scrollDirection: Axis.horizontal,

                          ),
                          items: snapshot.data!.map((BannerModelOffline banner) {
                            final imagePath = banner.imageUrl;
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                              child: SizedBox(
                                // height: 400,
                                // width: 500, // Specify a fixed width for each item
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child:  CachedNetworkImage(
                                    imageUrl: imagePath.toString(),
                                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }
                    },
                  ) :
                  FutureBuilder<List<BannerModelOffline>>(
                    future: localHomeRepo.fetchBanner(),
                    builder: (context, AsyncSnapshot<List<BannerModelOffline>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: RefreshProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Image.asset('images/no_image_in_db.png',fit: BoxFit.cover,);
                      } else {
                        return CarouselSlider(
                          options: CarouselOptions(
                            height: 400.0,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            initialPage: 0,
                            animateToClosest: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            pauseAutoPlayOnTouch: false,
                            aspectRatio: 16 / 9,
                            onPageChanged: (index, reason) {
                              // Do something when the page changes
                            },
                            scrollDirection: Axis.horizontal,

                          ),
                          items: snapshot.data!.map((BannerModelOffline banner) {
                            final imagePath = banner.imageUrl;
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                              child: SizedBox(
                                // height: 400,
                                // width: 500, // Specify a fixed width for each item
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child:  CachedNetworkImage(
                                    imageUrl: imagePath.toString(),
                                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                ),





                const SizedBox(height: 1,),
                //  Row(
                //    mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     for(var i = 0;i<images.length;i++)
                //         buildIndicator(currentIndex == i)
                //
                //   ],
                // ),
              ],
            );
  }
  // Widget buildIndicator(bool isSelected){
  //   return Padding(
  //     padding: const EdgeInsets.only(right: 3),
  //     child: Container(
  //       height: isSelected ? 10 : 10,
  //       width: isSelected ? 10 : 10,
  //       decoration: BoxDecoration(
  //           shape: BoxShape.circle,
  //           color: isSelected ? const Color(0xffde0201) : const Color(0xffd9d9d9)
  //       ),
  //     ),
  //   );
  // }


}
