import 'dart:core';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data_layer/repositories/cart_repo.dart';
import '../../domain_layer/models/cart_model.dart';
import '../../domain_layer/models/food_model.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartProducts> _items={};
  Map<int, CartProducts> get items=>_items;
  List<CartProducts>storageItems=[];
  List<CartProducts>cartStorage=[];
List<String>cartHistory=[];

  set setItems(Map<int, CartProducts> setItems) {
_items={};
_items=setItems;

  }

  void addItems(Products theproduct, int quantity){
    var totalQuantity=0;
    if(_items.containsKey(theproduct.id)){ //if it exist it means you are only adding to the quantity when you click on add
      _items.update(theproduct.id!, (value) {
        totalQuantity=value.quantity!+quantity;
        return CartProducts(
            id:value.id,
            name:value.name,
            price:value.price,
            img:value.img,
            quantity:value.quantity!+quantity,//exist only if you have left
            // and come back to that page
            isExist:true,
            time:DateTime.now().toString(),
            product: theproduct
        );

      }

      );


      if(totalQuantity<=0){
        _items.remove(theproduct.id);
      }
      update();
    }

    else{ //but if you are just adding it means it is a new element to be added and no additional quantity
      if(quantity>0) {

        _items.putIfAbsent(theproduct.id!, () {


          return CartProducts(
              id: theproduct.id,
              name: theproduct.title,
              price: theproduct.price,
              img: theproduct.thumbnail,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              product:theproduct
          );
        });

      }
      else{
        Get.snackbar('Item count', 'you cant reduce it more',

            colorText: Colors.white);
      }
      update();

    }

    cartRepo.addToCartList(getItems);
    update();
  }

  bool existInCart(Products products){
    if(_items.containsKey(products.id)){
      return true;
    }else{
      return false;
    }
  }
  void addToCart(){
    cartRepo.addToCartList(getItems);
    update();
  }
//this whole method works for when you have already added stuff to cart
// befire.you wanto check if it contains to list and then take the value of the previous
  //quantity added and set it to a varibale named quantity
  int getQuantity(Products products){//this gets the quantity of both stuff
    // in cart and the one you add recently
    var quantity=0;
    if(_items.containsKey(products.id)){
      items.forEach((key, value) {
        if(key==products.id){
          quantity=value.quantity!;
        }});
      update();
    }//this whole thing should exist only if you have already opened and clicked on add to cart
    return quantity;
  }
  int get totalItems{
    var totalQuantity=0;
    _items.forEach((key, value) {
      totalQuantity+=value.quantity!;
    });
    update();
    return totalQuantity;
  }
  List<CartProducts> get getItems{
    return _items.entries.map((e) {
      return e.value;
    }).toList();

  }
  int get totalPrice{
    var totalPrice=0;
    _items.forEach((key, value) {
      //any data coming from the database that requires a model is usually null in the model i.e int age?
      //to use its method you have to add ? or ! before thw dot
      //you cant assign a null variable to a not null, you have to add ! or ?? "" at the end
      totalPrice+=value.quantity!* int.parse(value.price!);
    });
    update();
    return totalPrice;
  }




  List<CartProducts>getCartData(){
    setCart=cartRepo.getCartList();
    return storageItems;
  }
  set setCart(List<CartProducts>items){
    storageItems=items;
    for(int i=0; i<storageItems.length;i++){
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }

  }
  // List<CartProducts>getCartHistoryList(){
  //   setCartHistory=cartRepo.getCartHistoryList();
  //   return cartStorage;
  // }
  //
  // set setCartHistory(List<CartProducts>cartHistory){
  //   cartStorage=cartHistory;
  //   for(int i=0;i<cartStorage.length;i++){
  //     _cartItems.putIfAbsent(cartStorage[i].product!.id!, () =>storageItems[i]);
  //   }
  // }
  void addToCartHistoryList(){
    cartRepo.addToCartHistoryList();
    clear();
  }
  void clear(){
    _items={};

    //clear the items list
  }
  List<CartProducts> getCartHistoryList(){
 return  cartRepo.getCartHistoryList();



  }

  void removeCartHistory(){


    cartRepo.removeCartHistory();

update();
  }
  Map<String, int> historyList={};


void addTime(){
  for(int j=0;j<getCartHistoryList().length;j++){
    if(historyList.containsKey(getCartHistoryList()[j].time)){
      historyList.update(getCartHistoryList()[j].time!, (value) =>++value );
    }
    else{
      historyList.putIfAbsent(getCartHistoryList()[j].time!, () => 1);
    }
  }

  update();
}
  List<int> orderList(){
    return historyList.entries.map((e) {
      return e.value;

    }).toList();

  }


}