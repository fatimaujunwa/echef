// import 'package:dot_navigation_bar/dot_navigation_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class NtisaHomeScreen extends StatefulWidget {
//   const NtisaHomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NtisaHomeScreen> createState() => _NtisaHomeScreenState();
// }
//
// class _NtisaHomeScreenState extends State<NtisaHomeScreen> {
//   int pageIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     double width=MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Color(0xffE5E5E5),
//       bottomNavigationBar:  buildMyNavBar(context),
//       body: SafeArea(
//         child: Container(
//           width: width,
//           margin: EdgeInsets.only(top: 52, left: 16, right: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//             Text(
//               'Deliver to',
//               style: TextStyle(
//                   fontFamily: "Raleway",
//                   fontSize: 14,
//                   color: Color(0xff0C0C0C).withOpacity(0.7),
//                   fontWeight: FontWeight.w700),
//
//             ),
//             SizedBox(
//               height: 6,
//             ),
//             Container(
//                 width: width,
//                 height:40 ,
//                 decoration:  BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: new BorderRadius.circular(8.0),
//                     boxShadow: [
//                       BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 10.0, spreadRadius: 0.4,
//                           offset: Offset(2,2)
//                       ),
//                       BoxShadow(color: Colors.white, blurRadius: 10.0, spreadRadius: 0.4,
//                           offset: Offset(-2,-2)
//                       ),
//                     ]
//
//                 ),
//                 child: TextField(
//                   decoration: InputDecoration(
//                       isDense: true,
//                       counterText: "",
//                       contentPadding: EdgeInsets.all(10.0),
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                           borderRadius:
//                           new BorderRadius.circular(10.0),
//                           borderSide: BorderSide.none)),
//                   textAlign: TextAlign.start,
//                   maxLines: 1,
//                   maxLength: 20,
//                   // controller: _locationNameTextController,
//                 )
//             ),
//               SizedBox(
//                 height: 18,
//               ),
//               Row(
//                 children: [
//                   ReusableContainer(text: 'Wallet', amount: '0.00', img: 'images/wallet.png',),
// SizedBox(width: 9,),
//                   ReusableContainer(text: 'Loyalty points', amount: '0', img: 'images/loyalty-point.png',imgHeight: 90,imgWidth: 90,left: 95,top: 10,),
//                   SizedBox(
//                     height: 16,
//                   )
//
//                 ],
//               ),
//               SizedBox(height: 16,),
//               Text('PROMOTE YOUR BUSINESS',style: TextStyle(
//                   fontFamily: "Raleway",
//                   fontSize: 18,
//                   color: Color(0xff0C0C0C).withOpacity(0.7),
//                   fontWeight: FontWeight.w700)),
//               SizedBox(height: 8,),
//               Stack(children: [
//                 Container(
//                   width: width,
//                     height: 148,
//                     decoration: BoxDecoration(
//                         color: Color(0xff27A445).withOpacity(0.1),
//                         border: Border.all( color: Color.fromRGBO(39, 164, 69, 0.2)),
//                         borderRadius:BorderRadius.circular(16) )
//                 )
//               ],),
//               SizedBox(height: 25,),
//               Text('OUR SERVICES',style: TextStyle(
//                   fontFamily: "Raleway",
//                   fontSize: 14,
//                   color: Color(0xff0C0C0C).withOpacity(0.7),
//                   fontWeight: FontWeight.w700)),
//               SizedBox(height: 8,),
//               Stack(
//                 children:
//                 [
//                   Container(
//                     padding: EdgeInsets.only(left:16,top: 20 ),
//                     width: width,
//                     height:124 ,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         gradient: LinearGradient(
//                             colors: [
//                               Color(0xffF4D35E
//                               ),
//                               Color(0xff27A445),
//
//
//                             ],
//                             begin: Alignment.topRight,
//                             end: Alignment.bottomLeft
//                         )
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Ntisa Food',style: TextStyle(fontWeight: FontWeight.w600,fontFamily: "Raleway",color: Color(0xffFCFEFD),fontSize: 18),),
//                         SizedBox(height: 8,),
//                         Text('Place orders and get it\ndelivered to you',style: TextStyle(fontWeight: FontWeight.w600,fontFamily: "Raleway",color: Color(0xffFCFEFD),fontSize: 14),)
//                       ],
//                     ),
//                   ),
//                   Positioned(
// left:280,top: 25,
//
//                       child: Container(
//                           height: 100,
//                           width: 100,
//                           child: Image(image: AssetImage('images/unboarding-2.png'))))
//                 ]
//               ),
//               SizedBox(height: 8,),
//               Stack(
//                   children:
//                   [
//                     Container(
//                       padding: EdgeInsets.only(left:16,top: 20 ),
//                       width: width,
//                       height:124 ,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(16),
//                           gradient: LinearGradient(
//                               colors: [
//                                 Color(0xffF4D35E
//                                 ),
//                                 Color(0xff27A445),
//
//
//                               ],
//                               begin: Alignment.topRight,
//                               end: Alignment.bottomLeft
//                           )
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Ntisa Food',style: TextStyle(fontWeight: FontWeight.w600,fontFamily: "Raleway",color: Color(0xffFCFEFD),fontSize: 18),),
//                           SizedBox(height: 8,),
//                           Text('Place orders and get it\ndelivered to you',style: TextStyle(fontWeight: FontWeight.w600,fontFamily: "Raleway",color: Color(0xffFCFEFD),fontSize: 14),)
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                         left:245,
//                         child: Container(
//                             height: 150,
//                             width: 150,
//                             child: Image(image: AssetImage('images/unboarding-1.png'))))
//                   ]
//               ),
//           ],),
//         ),
//       ),
//     );
//
//   }
//   Container buildMyNavBar(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: 16,right: 16,bottom:34 ),
//       height: 58,
//       decoration: BoxDecoration(
//         color:
//
//         Color(0xffF8F8F8),
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(15),
//           topRight: Radius.circular(15),
//           bottomLeft: Radius.circular(40),
//           bottomRight: Radius.circular(40)
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           GestureDetector(
//               onTap: (){
//                 setState(() {
//                   pageIndex=0;
//                 });
//               },
//               child: pageIndex==0?
//               Container(height: 22,width: 22.67,
//                 child: Image(image: AssetImage('images/ntisa-home-active-icon.jpg')),
//
//               ):            Container(height:22,width: 22.67,
//                 child: Image(image: AssetImage('images/ntisa-home-icon.png')),
//               )
//           ),
//           GestureDetector(
//               onTap: (){
//                 setState(() {
//                   pageIndex=1;
//                 });
//               },
//               child: pageIndex==1?
//               Container(height: 22,width: 22.67,
//                 child: Image(image: AssetImage('images/ntisa-orders-active-icon.png')),
//
//               ):   Container(height:22,width: 22.67,
//                 child: Image(image: AssetImage('images/ntisa-orders-icon.png')),
//               )
//           ),
//           GestureDetector(
//               onTap: (){
//                 setState(() {
//                   pageIndex=2;
//                 });
//               },
//               child: pageIndex==2?
//               Container(height:22,width: 22.67,
//                 child: Image(image: AssetImage('images/ntisa-paymetnts-active-icon.png')),
//               ): Container(height: 22,width: 22.67,
//                 child: Image(image: AssetImage('images/ntisa-paymetnts-icon.png')),
//               )
//           ),
//           GestureDetector(
//               onTap: (){
//                 setState(() {
//                   pageIndex=3;
//                 });
//               },
//               child: pageIndex==3?
//               Container(height:22,width: 22.67,
//                 child: Image(image: AssetImage('images/ntisa-accounts-active-icon.png')),
//               ): Container(height: 22,width: 22.67,
//                 child: Image(image: AssetImage('images/ntisa-accounts-icon.png')),
//               )
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ReusableContainer extends StatelessWidget {
//   final String text;
//   final String img;
//   final String amount;
//   final double imgHeight;
//   final double imgWidth;
//   final double top;
//   final double left;
//   const ReusableContainer({
//     Key? key,
//     required this.text,
//     required this.img,
//     required this.amount,
//     this.imgHeight=110,
//     this.imgWidth=110,
//     this.left=78,
//     this.top=7
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Stack(
//         children: [
//           Container(
//             height: 100,
//             width: 186,
//
//             decoration: BoxDecoration(
//                 color: Color(0xff27A445).withOpacity(0.1),
//                 border: Border.all( color: Color.fromRGBO(39, 164, 69, 0.2)),
//                 borderRadius:BorderRadius.circular(16) ),
//
//             child: Padding(
//               padding: const EdgeInsets.only(top: 10,left: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(text,  style: TextStyle(
//                       fontFamily: "Raleway",
//                       fontSize: 14,
//                       color: Color(0xff0C0C0C).withOpacity(0.5),
//                       fontWeight: FontWeight.w700),
//
//                   ),
//               Text('\$$amount',  style: TextStyle(
//                   fontFamily: "Raleway",
//                   fontSize: 18,
//                   color: Color(0xff27A445).withOpacity(0.5),
//                   fontWeight: FontWeight.w800)),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//               top: top,
//               left:left ,
//               child: Container(
//             height: imgHeight,
//             width: imgWidth,
//             child: Image(image: AssetImage(img),
//
//             ),
//           ))
//
//         ],
//       ),
//     );
//   }
// }
//
