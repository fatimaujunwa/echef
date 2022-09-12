import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../app_constants/app_variables.dart';
import '../../domain_layer/models/cart_model.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});
  List<String>cartList=[];
  List<String>cartHistoryList=[];

  void addToCartList(List<CartProducts> cart){

    cartList=[];
    var time=DateTime.now().toString();
    cart.forEach((element) {
      element.time=time;
      return cartList.add(jsonEncode(element));
    });
    sharedPreferences.setStringList(AppVariables.CARTLIST,cartList);
    getCartList();
  }

  void addToCartHistoryList(){
    if(sharedPreferences.containsKey(AppVariables.CARTHISTORYLIST)){

      cartHistoryList=sharedPreferences.getStringList(AppVariables.CARTHISTORYLIST)!;
    }

    for(int i=0;i<cartList.length;i++){
      cartHistoryList.add(cartList[i]);
      print('history'+cartList[i]);
    }
    sharedPreferences.setStringList(AppVariables.CARTHISTORYLIST, cartHistoryList);
    removeCart();



  }
  List <CartProducts> getCartList(){
    List <String>carts=[];

    if( sharedPreferences.containsKey(AppVariables.CARTLIST)){
      carts=sharedPreferences.getStringList(AppVariables.CARTLIST)!;
      if(carts==null){
        print(carts.length);
      }
      print(carts.toString());
    }
    List<CartProducts> cartList=[];
    carts.forEach((element) {

      cartList.add(CartProducts.fromJson(jsonDecode(element)));
    });

    return cartList;
  }
  List <CartProducts>getCartHistoryList(){
    if(sharedPreferences.containsKey(AppVariables.CARTHISTORYLIST)){
      cartHistoryList=[];
      cartHistoryList=sharedPreferences.getStringList(AppVariables.CARTHISTORYLIST)!;
      print(cartHistoryList.length);
      print('cart history'+cartHistoryList.toString());
    }
    List<CartProducts>cartListHistory=[];
    cartHistoryList.forEach((element) {
      cartListHistory.add(CartProducts.fromJson(jsonDecode(element)));//this returns objects
    });

    return cartListHistory;
  }

  void removeCart(){
    cartList=[];
    sharedPreferences.remove(AppVariables.CARTLIST);
  }


 void removeCartHistory(){
if(sharedPreferences.containsKey(AppVariables.CARTHISTORYLIST)){
  sharedPreferences.remove(AppVariables.CARTHISTORYLIST);

}
cartList=[];
cartHistoryList=[];


  }
}