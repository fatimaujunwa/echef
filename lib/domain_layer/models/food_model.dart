class FoodProducts {
  List<Products>? _products;
  List<Products>? get products=>_products;
  FoodProducts({required products}){
    this._products=products;
  }

  FoodProducts.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      _products = <Products>[];
      json['products'].forEach((v) {
        _products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._products != null) {
      data['products'] = this._products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  int? dealsId;
  int? typeId;
  String? title;
  String? price;
  String? description;
  String? thumbnail;
  String? createdAt;
  String? updatedAt;

  Products(
      {this.id,
        this.dealsId,
        this.typeId,
        this.title,
        this.price,
        this.description,
        this.thumbnail,
        this.createdAt,
        this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dealsId = json['deals_id'];
    typeId = json['type_id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['deals_id'] = this.dealsId;
    data['type_id'] = this.typeId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}