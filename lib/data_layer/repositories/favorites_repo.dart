import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../domain_layer/models/favorites_model.dart';

class FavoritesRepo{
  List <String>favoriteList=[];
  List <String>fav=[];
 final SharedPreferences sharedPreferences;
 FavoritesRepo({required this.sharedPreferences});

 void setFavorites(List<FavoriteProducts> favList){
 favoriteList=[];
   if(sharedPreferences.containsKey('Favorite-List')){
     sharedPreferences.getStringList('Favorite-List');
 }
  favList.forEach((element) {
   return favoriteList.add(jsonEncode(element));
  });

  sharedPreferences.setStringList('Favorite-List', favoriteList);
print('favorites'+sharedPreferences.getStringList('Favorite-List').toString());
 }

 List<FavoriteProducts> getFavorites(){
   if( sharedPreferences.containsKey('Favorite-List')){
     fav=sharedPreferences.getStringList('Favorite-List')!;
     if(fav==null){
       print(fav.length);
     }

   }
   List<FavoriteProducts>ListOfFav=[];
   List<FavoriteProducts>newFav=[];
   fav.forEach((element) {


     ListOfFav.add(FavoriteProducts.fromJson(jsonDecode(element)));
   });

ListOfFav.forEach((element) {
  element.like=true;
  newFav.add(element);
});
print('new fave'+newFav.toString());

   return newFav;
 }






}