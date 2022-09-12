

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data_layer/repositories/food_repo.dart';
import '../../domain_layer/models/food_model.dart';
import '../../domain_layer/models/food_types_model.dart';
import 'cart_controller.dart';

class FoodController extends GetxController implements GetxService{
  final FoodRepo foodRepo;
  List<Products>_foodList=[];
  List<Products>_foodTypeList=[];
  List<Products>get foodTypeList=>_foodTypeList;
  List<Products>_bestDeals=[];
  List<Products>get bestDeals=>_bestDeals;
  List<Products>get foodList=>_foodList;
  List<FoodTypes>_categories=[];
  List<FoodTypes>get categories=>_categories;
  late CartController _cart;
  bool _isLoaded= false;
  bool get isLoaded=>_isLoaded;
  int _quantity=0;
  int get quantity=>_quantity;
  int _inCartItems=0;
  int get inCartItems=>_inCartItems+_quantity;
  FoodController({required this.foodRepo});
   Future<void>getFood()async{
     Response response=await foodRepo.getFood();



if(response.statusCode==200){
  _foodList=[];
  _foodList.addAll(FoodProducts.fromJson(response.body).products!);

  print(_foodList.length);
  update();
}
else{
  print(response.statusCode);

}



   }

  Future<void>getBestDeals()async{
     Response response=await foodRepo.getBestDeals();



    if(response.statusCode==200){
      _bestDeals=[];
      _bestDeals.addAll(FoodProducts.fromJson(response.body).products!);
      update();
    }
    else{
      print('did not work');

    }



  }
  Future<void>getFoodType(int foodtype_id)async{
     Response response=await foodRepo.getFoodTypes(foodtype_id);
     if(response.statusCode==200){
       _foodTypeList=[];
       _foodTypeList.addAll(FoodProducts.fromJson(response.body).products!);
       print(response.body);
       update();
     }
     else{
       print('did not work');

     }
  }

  Future<void>getFoodCategories()async{
    Response response=await foodRepo.getFoodCategories();



    if(response.statusCode==200){
      _categories=[];
      _categories.addAll(FoodType.fromJson(response.body).foodTypes!);
      print(response.body);
      update();
    }
    else{
      print('did not work');

    }



  }
  void setQuantity(bool isIncrement){

    if (isIncrement) {
      _quantity =
          checkQuantity(_quantity + 1);

    }
    else {
      _quantity = checkQuantity(_quantity -
          1);

    }



    update();
  }
  int checkQuantity(int quantity){
    if(_inCartItems+quantity<0){

      Get.snackbar('Item count', 'you cant reduce it more',

          colorText: Colors.white);
      if(_inCartItems>0){
        _quantity=-_inCartItems;
        return quantity;
      }
      return 0;
    }
    else if(_inCartItems+quantity>20){
      Get.snackbar('Item count', 'you cant add more',

          colorText: Colors.white);
      return 20;
    }
    else{
      return quantity;
    }
  }
 initProduct(products,CartController cart) {

    _quantity=0;

    _inCartItems=0;
    _cart=cart;
    var exist=true;
    exist=_cart.existInCart(products);

    if(exist){
      _inCartItems=cart.getQuantity(products);
    }
    print('the quantity in the cart is' +_inCartItems.toString());
  }
  void addItem(Products products)  {//this just allows you to click and empty items into cart
    // if(_quantity>0){

    _cart.addItems(products, quantity,);
    _quantity=0;
    _inCartItems=_cart.getQuantity(products);
    _cart.items.forEach((key, value) {

      print("the id is"+value.id.toString()+"the quantity is"+value.quantity.toString());

      update();
    });


  }
  int totalItems(CartController cart){


     return cart.totalItems;
  }
  int totalPrice(CartController cart){
     return cart.totalPrice;
  }


  // int get totalItems{
  //    return _cart.totalItems;
  // }
}