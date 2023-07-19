//
// import 'package:ecommerceapp/pages/dummy/dummy_product.dart';
// import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
// import '../../../widgets/appbar_action_widgets.dart';
// import 'boxs.dart';
// import 'dummy_api_call.dart';
//
//
// class DummyHomePage extends StatefulWidget {
//   const DummyHomePage({super.key});
//
//   @override
//   State<DummyHomePage> createState() => DummyHomePageState();
// }
//
// class DummyHomePageState extends State<DummyHomePage> {
//   final _advancedDrawerController = AdvancedDrawerController();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     DummyApiCall dummyApiCall = DummyApiCall();
//     dummyApiCall.insertDataToHive();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     DummyApiCall dummyApiCall = DummyApiCall();
//     return AdvancedDrawer(
//       backdrop: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
//           ),
//         ),
//       ),
//       controller: _advancedDrawerController,
//       animationCurve: Curves.easeInOut,
//       animationDuration: const Duration(milliseconds: 300),
//       animateChildDecoration: true,
//       rtlOpening: false,
//       // openScale: 1.0,
//       disabledGestures: false,
//       childDecoration: const BoxDecoration(
//         // NOTICE: Uncomment if you want to add shadow behind the page.
//         // Keep in mind that it may cause animation jerks.
//         // boxShadow: <BoxShadow>[
//         //   BoxShadow(
//         //     color: Colors.black12,
//         //     blurRadius: 0.0,
//         //   ),
//         // ],
//         borderRadius: BorderRadius.all(Radius.circular(16)),
//       ),
//       drawer: SafeArea(
//         child: Container(
//           child: ListTileTheme(
//             textColor: Colors.white,
//             iconColor: Colors.white,
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Container(
//                   width: 128.0,
//                   height: 128.0,
//                   margin: const EdgeInsets.only(
//                     top: 24.0,
//                     bottom: 64.0,
//                   ),
//                   clipBehavior: Clip.antiAlias,
//                   decoration: const BoxDecoration(
//                     color: Colors.black26,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Image.asset(
//                     'images/fluttersourav.jpg',
//                   ),
//                 ),
//                 ListTile(
//                   onTap: () {},
//                   leading: const Icon(Icons.home),
//                   title: const Text('Home'),
//                 ),
//                 ListTile(
//                   onTap: () {},
//                   leading: const Icon(Icons.account_circle_rounded),
//                   title: const Text('Profile'),
//                 ),
//                 ListTile(
//                   onTap: () {},
//                   leading: const Icon(Icons.favorite),
//                   title: const Text('Favourites'),
//                 ),
//                 ListTile(
//                   onTap: () {},
//                   leading: const Icon(Icons.settings),
//                   title: const Text('Settings'),
//                 ),
//                 const Spacer(),
//                 DefaultTextStyle(
//                   style: const TextStyle(
//                     fontSize: 12,
//                     color: Colors.white54,
//                   ),
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(
//                       vertical: 16.0,
//                     ),
//                     child: const Text('Terms of Service | Privacy Policy'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//          // title: const Text('Advanced Drawer Example'),
//           leading: IconButton(
//             onPressed: _handleMenuButtonPressed,
//             icon: ValueListenableBuilder<AdvancedDrawerValue>(
//               valueListenable: _advancedDrawerController,
//               builder: (_, value, __) {
//                 return AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 250),
//                   child: Icon(
//                     value.visible ? Icons.clear : Icons.menu,
//                     key: ValueKey<bool>(value.visible),
//                   ),
//                 );
//               },
//             ),
//           ),
//           actions: const [
//             AppBarActionWidgets(),
//           ],
//         ),
//         body: ValueListenableBuilder<Box<Product>>(
//           valueListenable: Boxes.getData().listenable(),
//           builder: (context,box ,_){
//             var data = box.values.toList().cast<Product>();
//             return Padding(
//               padding: const EdgeInsets.symmetric(vertical: 12),
//               child: ListView.builder(
//                   itemCount: box.length,
//                   reverse: true,
//                   shrinkWrap: true,
//                   itemBuilder: (context, index){
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 10),
//                       child: Card(
//                         color: Colors.red,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(data[index].name.toString() ,
//                                     style: const TextStyle(fontSize: 20 , fontWeight: FontWeight.w500 , color: Colors.white),),
//                                   const SizedBox(width: 15,),
//
//
//                                 ],
//                               ),
//                               Text(data[index].price.toString(),
//                                 style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.w300, color: Colors.white),),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//   void _handleMenuButtonPressed() {
//     // NOTICE: Manage Advanced Drawer state through the Controller.
//     // _advancedDrawerController.value = AdvancedDrawerValue.visible();
//     _advancedDrawerController.showDrawer();
//   }
// }
//
// // ----------------------------------------------------------------------------------------------------------
// //----------------------------------------------------------------------------------------------
// //------------------------------------------------------------------------------------------
//
// // Scaffold(
// // appBar: AppBar(
// // elevation: 3,
// // backgroundColor: const Color(0xffdf0100),
// // actions: const [
// // AppBarActionWidgets(),
// // ],
// // ),
// // body: const SafeArea(
// // child:SingleChildScrollView(
// // child: Column(
// // children: [
// // CarouselSliderWidgets(),
// // SizedBox(height: 10,),
// //
// // ],
// // ),
// // ),
// // ),
// // ),
//
// // class CarouselSliderWidgets extends StatefulWidget {
// //   const CarouselSliderWidgets({super.key});
// //
// //   @override
// //   State<CarouselSliderWidgets> createState() => _CarouselSliderWidgetsState();
// // }
// //
// // class _CarouselSliderWidgetsState extends State<CarouselSliderWidgets> {
// //
// //   //int currentIndex = 0;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     DummyApValueListenableBuilder<Box<NotesModel>>(
// //       valueListenable: Boxes.getData().listenable(),
// //       builder: (context,box ,_){
// //         var data = box.values.toList().cast<NotesModel>();
// //         return Padding(
// //           padding: const EdgeInsets.symmetric(vertical: 12),
// //           child: ListView.builder(
// //               itemCount: box.length,
// //               reverse: true,
// //               shrinkWrap: true,
// //               itemBuilder: (context, index){
// //                 return Padding(
// //                   padding: const EdgeInsets.only(bottom: 10),
// //                   child: Card(
// //                     color: colors[random.nextInt(4)],
// //                     child: Padding(
// //                       padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         mainAxisAlignment: MainAxisAlignment.start,
// //
// //                         children: [
// //                           Row(
// //                             children: [
// //                               Text(data[index].title.toString() ,
// //                                 style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w500 , color: Colors.white),),
// //                               Spacer(),
// //                               InkWell(
// //                                   onTap: (){
// //                                     delete(data[index]);
// //                                   },
// //                                   child: Icon(Icons.delete , color: Colors.white,)),
// //                               SizedBox(width: 15,),
// //                               InkWell(
// //                                   onTap: (){
// //                                     _editDialog(data[index], data[index].title.toString(), data[index].description.toString());
// //                                   },
// //                                   child: Icon(Icons.edit, color: Colors.white,)) ,
// //
// //                             ],
// //                           ),
// //                           Text(data[index].description.toString(),
// //                             style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w300, color: Colors.white),),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               }
// //           ),
// //         );
// //       },
// //     ),
// //   }
// //
// // }