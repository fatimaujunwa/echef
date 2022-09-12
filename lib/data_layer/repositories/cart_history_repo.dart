import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';

import '../../domain_layer/models/cart_history_model.dart';
import '../../domain_layer/models/cart_model.dart';

class CartHistoryRepo{
  List <String>historyList=[];
  List <String>history=[];
  final SharedPreferences sharedPreferences;
  CartHistoryRepo({required this.sharedPreferences});

  void setHistory(List<CartHistory> cartList){
    historyList=[];
    if(sharedPreferences.containsKey('Cart-History-List')){
      sharedPreferences.getStringList('Cart-History-List');
    }
    cartList.forEach((element) {
      return historyList.add(jsonEncode(element));
    });

    sharedPreferences.setStringList('Cart-History-List', historyList);
    print('favorites'+sharedPreferences.getStringList('Favorite-List').toString());
  }

  List<CartHistory> getHistory(){
    if( sharedPreferences.containsKey('Favorite-List')){
      history=sharedPreferences.getStringList('Favorite-List')!;
      if(history==null){
        print(history.length);
      }

    }
    List<CartHistory>cartHistoryList=[];
    history.forEach((element) {
      cartHistoryList.add(CartHistory.fromJson(jsonDecode(element)));
    });



    return cartHistoryList;
  }
}