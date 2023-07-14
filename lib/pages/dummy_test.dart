// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:ecommerceapp/apis/banner_apis.dart';
// import 'package:flutter/material.dart';
//
// import '../../widgets/appbar_action_widgets.dart';
// import '../model/banner_model.dart';
//
//
//
//
// class DummyHomePage extends StatefulWidget {
//   const DummyHomePage({super.key});
//
//   @override
//   State<DummyHomePage> createState() => _DummyHomePageState();
// }
//
// class _DummyHomePageState extends State<DummyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: GestureDetector(
//         onTap: ()=> FocusScope.of(context).unfocus(),
//         child: Scaffold(
//           appBar: AppBar(
//             elevation: 3,
//             backgroundColor: const Color(0xffdf0100),
//             actions: const [
//               AppBarActionWidgets(),
//             ],
//           ),
//           body:  const SafeArea(
//             child:SingleChildScrollView(
//               child: Column(
//                 children: [
//                   CarouselSliderWidgets(),
//                   SizedBox(height: 10,),
//
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // ----------------------------------------------------------------------------------------------------------
// //----------------------------------------------------------------------------------------------
// //------------------------------------------------------------------------------------------
//
//
// class CarouselSliderWidgets extends StatefulWidget {
//   const CarouselSliderWidgets({super.key});
//
//   @override
//   State<CarouselSliderWidgets> createState() => _CarouselSliderWidgetsState();
// }
//
// class _CarouselSliderWidgetsState extends State<CarouselSliderWidgets> {
//
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 160,
//           width: double.infinity,
//           child: FutureBuilder<List<BannerModel>>(
//             future: BannerApis.fetchImages(),
//             builder: (context, AsyncSnapshot<List<BannerModel>> snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: RefreshProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               } else {
//                 return CarouselSlider(
//                   options: CarouselOptions(
//                     height: 400.0,
//                     enlargeCenterPage: true,
//                     enableInfiniteScroll: false,
//                     initialPage: 0,
//                    animateToClosest: false,
//                     autoPlay: true,
//                     autoPlayInterval: const Duration(seconds: 3),
//                     pauseAutoPlayOnTouch: false,
//                     aspectRatio: 16 / 9,
//                     onPageChanged: (index, reason) {
//                       // Do something when the page changes
//                     },
//                     scrollDirection: Axis.horizontal,
//
//                   ),
//                   items: snapshot.data!.map((BannerModel banner) {
//                     final imagePath = banner.imageUrl;
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
//                       child: SizedBox(
//                         // height: 400,
//                         // width: 500, // Specify a fixed width for each item
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.network(
//                             imagePath.toString(),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 );
//               }
//             },
//           ),
//         ),
//
//
//
//
//
//         const SizedBox(height: 1,),
//         //  Row(
//         //    mainAxisAlignment: MainAxisAlignment.center,
//         //   children: [
//         //     for(var i = 0;i<images.length;i++)
//         //         buildIndicator(currentIndex == i)
//         //
//         //   ],
//         // ),
//       ],
//     );
//   }
// }