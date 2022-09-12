import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ifood/application_layer/dependencies.dart' as dep;

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ifood/domain_layer/models/cart_history_model.dart';
import 'package:ifood/presentation_layer/controllers/cart_controller.dart';
import 'package:ifood/presentation_layer/controllers/food_controller.dart';
import 'package:ifood/presentation_layer/controllers/location_controller.dart';
import 'package:ifood/presentation_layer/controllers/user_controller.dart';
import 'package:ifood/presentation_layer/screens/favorites_page.dart';
import 'package:ifood/presentation_layer/screens/food_screen.dart';
import 'package:ifood/presentation_layer/screens/home_page.dart';
import 'package:ifood/presentation_layer/screens/location.dart';
import 'package:ifood/presentation_layer/screens/ntisa_homescreen.dart';
import 'package:ifood/presentation_layer/screens/order_history_screen.dart';
import 'package:ifood/presentation_layer/screens/profile_screen.dart';
import 'package:ifood/presentation_layer/screens/sign_up_page.dart';
import 'package:ifood/presentation_layer/screens/signin_page.dart';
import 'package:ifood/presentation_layer/screens/test.dart';
import 'app_constants/route_helper.dart';
import 'app_constants/size_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dep.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<FoodController>().getFood();

    Get.find<FoodController>().getBestDeals();
    Get.find<FoodController>().getFoodCategories();
    Get.find<CartController>().getCartHistoryList();
    Get.find<LocationController>();
    // Get.find<CartController>().removeCartHistory();
  }

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // home:ProfileScreen(),

            initialRoute: RouteHelper.foodScreen,
            getPages: RouteHelper.routes);
      });
    });
  }
}
