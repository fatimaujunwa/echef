import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_constants/app_variables.dart';
import '../data_layer/repositories/cart_repo.dart';
import '../data_layer/repositories/favorites_repo.dart';
import '../data_layer/repositories/food_repo.dart';
import '../data_layer/repositories/location_repo.dart';
import '../data_layer/repositories/user_repo.dart';
import '../presentation_layer/controllers/cart_controller.dart';
import '../presentation_layer/controllers/favorites_controller.dart';
import '../presentation_layer/controllers/food_controller.dart';
import '../presentation_layer/controllers/location_controller.dart';
import '../presentation_layer/controllers/user_controller.dart';
import 'services/api_client.dart';

Future<void>init(
    )async{
  final sharedPreferences=await SharedPreferences.getInstance();
  Get.lazyPut(()=> ApiClient(appBaseUrl: AppVariables.BASE_URI));
  Get.lazyPut(() => sharedPreferences);

  //repositories
  Get.lazyPut(() => LocationRepo(apiClient: Get.find()));
  Get.lazyPut(() => FoodRepo(apiClient: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences:Get.find()));
  Get.lazyPut(() => FavoritesRepo(sharedPreferences:Get.find()));

  //controllers
  Get.lazyPut(() => UserController( userRepo: Get.find()));
  Get.lazyPut(() => FoodController( foodRepo: Get.find()));
  Get.lazyPut(() => LocationController( locationRepo: Get.find()));
  Get.lazyPut(() => CartController( cartRepo: Get.find()));
  Get.lazyPut(() => FavoritesController( FavRepo: Get.find()));
  // Get.lazyPut(() => PopularProductController( popularProductRepo: Get.find()));
  // Get.lazyPut(() => RecommendedProductController( recommendedProductRepo: Get.find()));
}
