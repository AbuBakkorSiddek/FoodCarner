import 'package:flutter/material.dart';
import 'package:foodcorner/color/colors.dart';

// class DrawerSide extends StatefulWidget {
//   final IconData iconData;
//   final String text;
//   final Function() onTap;
//
//   const DrawerSide(
//       {Key? key,
//       required this.iconData,
//       required this.text,
//       required this.onTap})
//       : super(key: key);
//
//   @override
//   _DrawerSideState createState() => _DrawerSideState();
// }
//
// class _DrawerSideState extends State<DrawerSide> {
//   Widget listTile({required IconData iconData, required String titletext,required Function() onTap}) {
//     return Container(
//       height: 50,
//       child: ListTile(
//         onTap: onTap,
//         leading: Icon(
//           iconData,
//           size: 28,
//         ),
//         title: Text(
//           titletext,
//           style: TextStyle(color: textColor),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//         child: Container(
//       color: primaryColor,
//       child: ListView(
//         children: [
//           DrawerHeader(
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.white54,
//                   radius: 45,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.yellow,
//                     radius: 42,
//                     child: Image.asset('images/foodcorner.png'),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Welcome To FoodCorner',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       'Gust',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       height: 30,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.0),
//                         border: Border.all(width: 2),
//                       ),
//                       child: OutlinedButton(
//                         onPressed: () {},
//                         child: Text(
//                           'LOGIN',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           listTile(iconData: Icons.home_outlined, titletext: 'Home', onTap: () {  }),
//           listTile(iconData: Icons.shop_outlined, titletext: 'Review Cart', onTap: () {  }),
//           listTile(iconData: Icons.person_outlined, titletext: 'My Profile', onTap: () {  }),
//           listTile(iconData: Icons.notifications_outlined,titletext: 'Notification', onTap: () {  }),
//           listTile(iconData: Icons.star_border_outlined, titletext: 'Rating & Star', onTap: () {  }),
//           listTile(iconData: Icons.favorite_border_outlined, titletext: 'WishList', onTap: () {  }),
//           listTile(iconData: Icons.copy_outlined, titletext: 'Raise a Complaint', onTap: () {  }),
//           listTile(iconData: Icons.format_quote_outlined, titletext: 'FAQs', onTap: () {  }),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//                 child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Contact Support',
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       'Call Us :',
//                       style:
//                           TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       '01640382039 :',
//                       style:
//                           TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: Row(
//                     children: [
//                       Text(
//                         'Mail Us : ',
//                         style: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         'siddek7277@gmail.com',
//                         style: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             )),
//           )
//         ],
//       ),
//     ));
//   }
// }
