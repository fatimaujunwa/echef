

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data_layer/repositories/favorites_repo.dart';
import '../../domain_layer/models/favorites_model.dart';
import '../../domain_layer/models/food_model.dart';

class FavoritesController extends GetxController{
  final FavoritesRepo FavRepo;
  FavoritesController({required this.FavRepo});
  List<FavoriteProducts>favList=[];
  Map<int, FavoriteProducts> _list={};

  Map<int, bool> ?_favoriteFood={-1:false};
  Map<int, bool> ?get favoriteFood=>_favoriteFood;

  Map<int, bool> ?_favoriteBestDeal={-1:false};
  Map<int, bool> ?get favoriteBestDeal=>_favoriteBestDeal;

  Map<int, FavoriteProducts> get list=>_list;
  bool _addToFavorites=true;

  bool get addToFavorites=>_addToFavorites;
void favFood(Products theproduct){

    update();
    if(_favoriteFood!.containsKey(theproduct.id)){
      _favoriteFood!.update(theproduct.id!, (value) => !value);
    }

    _favoriteFood!.putIfAbsent(theproduct.id!, () => _addToFavorites);
    update();


  }

  // List<bool> get getFav{
  //   return _fav.entries.map((e) {
  //     return e.value;
  //   }).toList();
  //
  // }
  void addFavoriteItems(Products theproduct){
    // _addToFavorites=!_addToFavorites;
    update();
    // print(_addToFavorites);
    if(_list.containsKey(theproduct.id)){
      _list.update(theproduct.id!, (value) {

        return FavoriteProducts(
            id:value.id,
            name:value.name,
            price:value.price,
            img:value.img,
            like: value.like!,

            time:DateTime.now().toString(),
            product: theproduct
        );

      }

      );

    }

    else{

        _list.putIfAbsent(theproduct.id!, () {

          return FavoriteProducts(
              id: theproduct.id,
              name: theproduct.title,
              price: theproduct.price,
              img: theproduct.thumbnail,
              time: DateTime.now().toString(),
              product:theproduct,
              like: false
          );
        });




}

    FavRepo.setFavorites(getItems);
update();
  }

  List<FavoriteProducts> get getItems{
    return _list.entries.map((e) {
      return e.value;
    }).toList();

  }
  List<FavoriteProducts>getFavoriteData(){
    setFav=FavRepo.getFavorites();

    return favList;
  }
  set setFav(List<FavoriteProducts>items){
    favList=items;
    for(int i=0; i<favList.length;i++){
      _list.putIfAbsent(favList[i].product!.id!, () => favList[i]);
    }

  }


}