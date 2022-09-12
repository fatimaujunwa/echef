class SignUpBody{
  final String username;
  final String email;
  final String password;
  final String phonenumber;
  SignUpBody({

   this.email='ade@gmail.com',
     this.username='ade1234',
     this.phonenumber='09029811348',
     this.password='123456789',

  });

  Map<String,dynamic> toJson() {
    // final Map<String, dynamic> data =new Map<String,dynamic>();
    return {
      'name': this.username,
      "email": this.email,
      "password": this.password,
      "phonenumber": this.phonenumber,
      // return data;
    };
  }}