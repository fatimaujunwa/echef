
import 'package:get/get.dart';

import '../../data_layer/repositories/user_repo.dart';
import '../../domain_layer/models/sign_in_model.dart';
import '../../domain_layer/models/user_model.dart';

class UserController extends GetxController implements GetxService{
  final UserRepo userRepo;
  UserController({required this.userRepo});
bool _loaded=false;
bool get loaded=>_loaded;
List <UserModel>_user=[];
List<UserModel> get user=>_user;

  Future<void>register(Map<String,dynamic>data)async{
    Response response=await userRepo.register(data);


    if(response.statusCode==200){
      // repo.saveUserToken(response.body["token"]);
      _loaded=true;
    }
    else{
     _loaded=false;
    }
  }

  Future<void>login(Map<String,dynamic>data)async{
    Response response=await userRepo.login(data);

    if(response.statusCode==200){
      _loaded=true;

      _user.add(UserModel.fromJson(response.body));

      print(_user.length);

      update();
    }
    else{
      _loaded=false;
    }
  }


  Future<void>test(Map<String,dynamic>data)async{
    Response response=await userRepo.test(data);

    if(response.statusCode==200){
      // repo.saveUserToken(response.body["token"]);
      print(response.body);
    }
    else{
      print('not working');
    }
  }


}