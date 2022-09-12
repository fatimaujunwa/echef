
import '';
import 'food_model.dart';
class CartProducts {
  int? id;
  String? name;

  String? price;

  String? img;


  int? typeId;
  String? time;
  bool? isExist;
  int? quantity;
  Products? product;
  CartProducts(
      {this.id,
        this.name,
        this.quantity,
        this.isExist,
        this.price,
        this.time,
        this.img,
        this.product,
        this.typeId,});

  CartProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity=json['quantity'];
    time=json['time'];
    isExist=json['isExist'];
    price = json['price'];

    img = json['img'];

    typeId = json['type_id'];
    product=Products.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return{
      'id':this.id,
      'name':this.name,

      'price':this.price,

      'img':this.img,
      'time':this.time,
      'type_id': this.typeId,

      'isExist':this.isExist,
      'quantity':this.quantity,
      'product':this.product!.toJson(),
    };
  }
}