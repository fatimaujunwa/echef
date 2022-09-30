
import 'package:flutter/cupertino.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ifood/presentation_layer/controllers/cart_controller.dart';

import '../../app_constants/custom_snackbar.dart';
import '../../app_constants/route_helper.dart';




class Payment {
  BuildContext ctx;
  int price;
  String email;
  Payment({required this.ctx, required this.price, required this.email});
  PaystackPlugin paystackPlugin = PaystackPlugin();
  //initisalize plugin
  Future initPlugin() async {
    await paystackPlugin.initialize(
        publicKey: 'pk_test_e7a0ccaadc5f41ea3c5173b4a96df24a0136e02b');
  }

  //reference
  String _getReference() {
    String platform = 'iOS';

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  PaymentCard _getCardFromUI() {
    // Using just the must-required parameters.
    return PaymentCard(
      number: '',
      cvc: '',
      expiryMonth: 0,
      expiryYear: 0,
    );
  }

//method of charging card and making payments
  bool cardResponse = false;

  Future chargeCard(CartController controller) async {
    initPlugin().then((value) async {
      Charge charge = Charge()
        ..amount = price * 100
        ..email = email
        ..reference = _getReference()
        ..card = _getCardFromUI();

      CheckoutResponse response = await paystackPlugin
          .checkout(ctx,
          charge: charge,
          method: CheckoutMethod.card,
          fullscreen: false,
           )
          .then((value) {
        if (value.status == true) {
          controller.addToCartHistoryList();
          Get.toNamed(RouteHelper.getCheckOut());
          showCustomSnackBar('Congratulations! your transaction was successful' );
        } else if (value.status == null) {
          showCustomSnackBar(
              'Please make sure you are connected to the internet',
          );
        } else {
          showCustomSnackBar('Transaction terminated');
        }
        Navigator.pop(ctx);
        return value;
      });
//       print('Response $response');
//       if(response.status==true){
// cardResponse=true;
// // Navigator.pop(ctx);

//       }
//       else if(response==null){
//         cardResponse=false;
//         // Navigator.pop(ctx);
//         showCustomSnackBar('Please make sure you are connected to the internet', 'transaction message');
//       }
//       else{
//         cardResponse=false;
//         showCustomSnackBar('Sorry! transaction failed, please try again', 'transaction message');
//       }
    });

    // print('card from paymet'+cardResponse.toString());
  }
}
