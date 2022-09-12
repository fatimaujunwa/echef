class UserModel {
  String? username;
  String? email;
  String? phonenumber;

  UserModel({this.username, this.email, this.phonenumber});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    phonenumber = json['phonenumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['phonenumber'] = this.phonenumber;
    return data;
  }
}