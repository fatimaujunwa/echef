class FoodType {
  List<FoodTypes>? _foodTypes;
  List<FoodTypes>? get foodTypes=>_foodTypes;
  FoodType({required foodTypes}){
    this._foodTypes=foodTypes;
  }

  FoodType.fromJson(Map<String, dynamic> json) {
    if (json['food_types'] != null) {
      _foodTypes = <FoodTypes>[];
      json['food_types'].forEach((v) {
        _foodTypes!.add(new FoodTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._foodTypes != null) {
      data['food_types'] = this._foodTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FoodTypes {
  int? id;
  String? title;
  int? parentId;
  int? order;
  String? createdAt;
  String? updatedAt;
  Null? foodId;

  FoodTypes(
      {this.id,
        this.title,
        this.parentId,
        this.order,
        this.createdAt,
        this.updatedAt,
        this.foodId});

  FoodTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    parentId = json['parent_id'];
    order = json['order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    foodId = json['food_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['parent_id'] = this.parentId;
    data['order'] = this.order;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['food_id'] = this.foodId;
    return data;
  }
}