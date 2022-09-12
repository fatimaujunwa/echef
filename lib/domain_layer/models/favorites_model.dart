



import 'food_model.dart';

class FavoriteProducts {
  int? id;
  String? name;

  String? price;

  String? img;
bool? like;

  int? typeId;
  String? time;
  bool? isExist;
  int? quantity;
  Products? product;
  FavoriteProducts(
      {this.id,
        this.name,
        this.quantity,
        this.isExist,
        this.price,
        this.time,
        this.img,
        this.product,
        this.typeId,
        this.like,
      });

  FavoriteProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    time=json['time'];

    price = json['price'];

    img = json['img'];

like=json['like'];
    product=Products.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return{
      'id':this.id,
      'name':this.name,

      'price':this.price,

      'img':this.img,
      'like':this.like,

      'product':this.product!.toJson(),
    };
  }
}