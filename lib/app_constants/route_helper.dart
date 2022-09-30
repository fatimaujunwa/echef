
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'package:ifood/presentation_layer/screens/food_categories_items.dart';
import 'package:ifood/presentation_layer/screens/location.dart';

import '../presentation_layer/screens/cart_screen.dart';
import '../presentation_layer/screens/check_out_screen.dart';
import '../presentation_layer/screens/favorites_page.dart';
import '../presentation_layer/screens/food_detail_screen.dart';
import '../presentation_layer/screens/food_screen.dart';
import '../presentation_layer/screens/home_page.dart';
import '../presentation_layer/screens/order_history_screen.dart';
import '../presentation_layer/screens/profile_screen.dart';
import '../presentation_layer/screens/sign_up_page.dart';
import '../presentation_layer/screens/signin_page.dart';

class RouteHelper{
  static const String initial="/";
  static const String signUp="/sign-up";
  static const String signIn="/sign-in";

  static const String submit="/submit";
  static const String location="/location";
  static const String orders="/orders";
  static const String cartPage="/cart-page";
  static const String orderToCart="/orders-cart";
  static const String proceed="/proceed";
  static const String checkOut="/check-out";
  static const String favoritePage="/favorite-page";
  static const String orderDetails="/order-details";
  static const String logout="/logout";
  static const String profile="/profile";
  static const String foodScreen="/food-screen";
  static const String itemsScreen="/items-screen";
  static const String orderid="/order-id";
  static  String getSignin()=>'$signIn';
  static  String getSignup()=>'$signUp';
  static  String getInitial()=>'$initial';
  static  String getSubmit()=>'$submit';
  static  String getLocation()=>'$location';
  static  String getOrder(int pageId)=>'$orders?pageId=$pageId';

  static  String getItems(int itemsId)=>'$itemsScreen?itemsId=$itemsId';
  static  String getCartPage()=>'$cartPage';
  static  String getOrderToCart()=>'$orderToCart';
  static  String getProceed()=>'$proceed';
  static  String getCheckOut()=>'$checkOut';
  static  String getFavorite()=>'$favoritePage';

  static  String getOrdersDetails()=>'$orderDetails';
  static  String getProceedPage()=>'$proceed';
  static  String getLogOut()=>'$logout';
  static  String getProfile()=>'$profile';
  static  String getFoodScreen()=>'$foodScreen';


  static List<GetPage> routes=[
    // GetPage(name: initial, page: ()=>MainFoodPage()),
    // GetPage(name: popularFood, page: ()=>PopularFoodDetail()),
    GetPage(name: initial, page: (){
      return HomePage();
    },
      transition: Transition.fadeIn,


    ),
    GetPage(name: orders, page: (){
      var pageId=Get.parameters['pageId'];
      return FoodDetailScreen(pageId: int.parse(pageId!));
    },
      transition: Transition.fadeIn,


    ),





    GetPage(name: itemsScreen, page: (){
      var itemsId=Get.parameters['itemsId'];
      return FoodCategoryItems(itemsId: int.parse(itemsId!));
    },
      transition: Transition.fadeIn,


    ),
    //
    GetPage(name: orderToCart, page: (){
      return CartScreen();
    },
      transition: Transition.fadeIn,


    ),
    //
    //
    GetPage(name: foodScreen, page: (){
      return FoodScreen();
    },
      transition: Transition.fadeIn,


    ),
    //
    GetPage(name: location, page: (){


      return UserLocation();
    },
      transition: Transition.zoom,


    ),

    GetPage(name: proceed, page: (){

      return CheckOutScreen();
    },
      transition: Transition.fadeIn,


    ),
    //
    GetPage(name: checkOut, page: (){
      return OrderHistoryScreen();
    },
      transition: Transition.fadeIn,


    ),
    //
    GetPage(name: favoritePage, page: (){

      return FavoritesPage();
    },
      transition: Transition.fadeIn,
    ),
    //
    GetPage(name: profile, page: (){
      var pageId=Get.parameters['pageId'];
      return ProfileScreen();
    },

      transition: Transition.fadeIn,
    ),
  GetPage(name: signIn, page: (){

  return SignInPage();
  },
    transition: Transition.fadeIn,
  ),

    GetPage(name: signUp, page: (){

      return SignUpPage();
    },
      transition: Transition.fadeIn,
    )
  ];
}