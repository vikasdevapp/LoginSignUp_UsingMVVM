import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvmloginsignup/models/user_model.dart';
import 'package:mvvmloginsignup/routes/routes_name.dart';
import 'package:mvvmloginsignup/view_model/user_view_model.dart';

class SplashServices{


  Future<UserModel> getUserData()=>UserViewModel().getUser();

  void checkAuthentication(BuildContext context){
    getUserData().then((value) async{

      if(value.token=='null'||value.token==''){
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesNames.login);
      }else{
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesNames.home);
      }

    }).onError((error,printStackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}