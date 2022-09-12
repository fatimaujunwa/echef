
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../presentation_layer/controllers/user_controller.dart';
import '../dimensions.dart';
import '../route_helper.dart';


const profileTextStyle=TextStyle(color: Colors.white);

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  
  
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    var user=Get.find<UserController>().user;
    return Drawer(
     
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/foodwall1.jpg'),
              fit: BoxFit.cover,
            )
          ),
      child: 
          Container(
            height: MediaQuery.of(context).size.height,
            width: 50,
            color: Colors.black.withOpacity(0.7),
       child: ListView(
         padding: EdgeInsets.only(top: 0,left: 15,right: 15),
         children: [
       Container(

         color: Colors.black.withOpacity(0.5),
         width: 200,
        height: 200,
         child: Column(
           children: [
             Container(
margin: EdgeInsets.only(top: 50),
               height: 70,
               width: 70,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(7),
                 color: Dimensions.color,

               ),
             ),
             Container(
                 margin: EdgeInsets.only(top: 15),
                 child: Text('',style: profileTextStyle,))
           ],
         ),

       ),
          SizedBox(height: 30,),
           Container(
             height: 70,
             width: 200,
             color: Colors.black.withOpacity(0.5),

             child: ListTile(
               leading: Icon(Icons.contacts,color: Colors.white,),
               title: Text('Contacts',style: profileTextStyle,),
             ),
           ),
           SizedBox(height: 30,),
           GestureDetector(
             onTap: (){

               Get.toNamed(RouteHelper.getCheckOut());
             },
             child: Container(
               height: 70,
               width: 200,
               color: Colors.black.withOpacity(0.5),

               child: ListTile(
                 leading: Icon(FontAwesomeIcons.cube,color: Colors.white),
                 title: Text('Orders',style: profileTextStyle,),
               ),
             ),
           ),
           SizedBox(height: 30,),
           GestureDetector(
             onTap: (){
               Get.toNamed(RouteHelper.getFavorite());
             },
             child: Container(

               height: 70,
               width: 200,
               color: Colors.black.withOpacity(0.5),
               child: ListTile(
                 leading: Icon(Icons.favorite,color: Colors.white),
                 title: Text('Favorites',style: TextStyle(color: Colors.white),),
               ),
             ),
           ),
           SizedBox(height: 200,),
           Container(
margin: EdgeInsets.only(left: 100),
             height: 60,
             width: 50,
             color: Colors.black.withOpacity(0.5),
             child: GestureDetector(
               onTap: (){


               },

               child: ListTile(
                 leading: Icon(Icons.exit_to_app_outlined,color: Colors.white),
                 title: Text('Logout',style: TextStyle(color: Colors.white),),
               ), ),
           ),
         ],
       ),   ),

        ),
     
    );
  }
}
