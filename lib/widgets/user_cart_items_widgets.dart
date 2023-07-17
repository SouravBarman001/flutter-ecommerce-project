// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:ecommerceapp/model/cart_model.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
//
// import '../controller/cart_controller.dart';
// import '../database_helper/db_helper.dart';
//
//
// class UserCardItems extends StatefulWidget {
//   const UserCardItems({
//     super.key,required this.index, required this.sqlDataStored,
//   });
//   final Cart sqlDataStored;
//   final int index;
//
//   @override
//   State<UserCardItems> createState() => _UserCardItemsState();
// }
//
// class _UserCardItemsState extends State<UserCardItems> {
//   DBHelper? dbHelper = DBHelper();
//   @override
//   Widget build(BuildContext context) {
//     final cart  = Provider.of<CartProvider>(context);
//     return Padding(
//       padding: const EdgeInsets.only(top: 8,left: 8,right: 8),
//       child: Material(
//         elevation: 2,
//         child: Container(
//           // decoration: const BoxDecoration(
//           // //  borderRadius: BorderRadius.circular(10),
//           // ),
//           // padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10,),
//           height: 100,
//           width: double.infinity,
//           color: const Color(0xfffdfdfd),
//           child: Row(
//             children: [
//               GestureDetector(
//                   onTap: () {
//
//                   },
//                   child: IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.close_outlined,
//                       color: Colors.red,
//                     ),
//                   )),
//               ClipRRect(
//                 child: Image.network(
//                   '',
//                   height: 100,
//                   width: 60,
//                 ),
//               ),
//               const SizedBox(
//                 width: 5,
//               ),
//               const Expanded(
//                 flex: 2,
//                 child: AutoSizeText(
//                   'Fazli Mango From Rajshahi',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//                   maxLines: 3,
//                 ),
//               ),
//               const SizedBox(
//                 width: 1,
//               ),
//               const Expanded(
//                   child: Text(
//                     'Tk:120',
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.red),
//                   )),
//               const SizedBox(
//                 width: 5,
//               ),
//               Container(
//                 color: const Color(0xffecedef),
//                 padding: const EdgeInsets.only(
//                     left: 15, right: 15, top: 5, bottom: 5),
//                 child: const Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Icon(Icons.add),
//                     Text(
//                       '1',
//                       style: TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                     FaIcon(
//                       FontAwesomeIcons.minus,
//                       size: 16,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
