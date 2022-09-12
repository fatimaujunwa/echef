
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data_layer/repositories/cart_history_repo.dart';
import '../../domain_layer/models/cart_history_model.dart';
import '../../domain_layer/models/cart_model.dart';
import '../../domain_layer/models/food_model.dart';

class CartHistoryController extends GetxController{
  final CartHistoryRepo cartHistoryRepo;
  CartHistoryController({required this.cartHistoryRepo});
  List<CartHistory>historyList=[];
  Map<int, CartHistory> _list={};
  Map<int, CartHistory> get list=>_list;
  void addHistoryItems(Products theproduct){
    if(_list.containsKey(theproduct.id)){
      _list.update(theproduct.id!, (value) {

        return CartHistory(
          id: value.id,
            name:value.name,
            price:value.price,
            img:value.img,
            time:DateTime.now().toString(),
            product: theproduct
        );


      }

      );

    }else{

      _list.putIfAbsent(theproduct.id!, () {

        return CartHistory(
            id: theproduct.id,
            name: theproduct.title,
            price: theproduct.price,
            img: theproduct.thumbnail,
            time: DateTime.now().toString(),
            product:theproduct
        );
      });




    }

    cartHistoryRepo.setHistory(getItems);
    update();
  }

  List<CartHistory> get getItems{
    return _list.entries.map((e) {
      return e.value;
    }).toList();

  }
  List<CartHistory>getHistoryData(){
    setFav=cartHistoryRepo.getHistory();
    return historyList;
  }
  set setFav(List<CartHistory>items){
    historyList=items;
    for(int i=0; i<historyList.length;i++){
      _list.putIfAbsent(historyList[i].product!.id!, () => historyList[i]);
    }

  }


}