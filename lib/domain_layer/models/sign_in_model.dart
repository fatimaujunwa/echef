class SignInBody{

  late  String _email;

  late String _password;
  SignInBody({required email, required password}){

    this._email=email;

    this._password=password;

    // print(_email);
    // print(_password);

  }
  SignInBody.fromJson(Map<String,dynamic>json){

    _email=json['email'];

    _password=json['password'];
  }
  Map<String,dynamic>toJson(){
    Map<String,dynamic>data =new Map<String, dynamic>();
    return{

      'email':this._email,

      'password':this._password,
    };
  }




}