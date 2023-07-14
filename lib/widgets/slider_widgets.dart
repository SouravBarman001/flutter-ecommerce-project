import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../apis/banner_apis.dart';
import '../model/banner_model.dart';

class SliderWidgets extends StatefulWidget {
  const SliderWidgets({super.key});

  @override
  State<SliderWidgets> createState() => _SliderWidgetsState();
}

class _SliderWidgetsState extends State<SliderWidgets> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          width: double.infinity,
          child: FutureBuilder<List<BannerModel>>(
            future: BannerApis.fetchImages(),
            builder: (context, AsyncSnapshot<List<BannerModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: RefreshProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
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
                  items: snapshot.data!.map((BannerModel banner) {
                    final imagePath = banner.imageUrl;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                      child: SizedBox(
                        // height: 400,
                        // width: 500, // Specify a fixed width for each item
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            imagePath.toString(),
                            fit: BoxFit.cover,
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
