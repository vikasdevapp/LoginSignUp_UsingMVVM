import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvmloginsignup/models/user_model.dart';
import 'package:mvvmloginsignup/repository/auth_repository.dart';
import 'package:mvvmloginsignup/routes/routes_name.dart';
import 'package:mvvmloginsignup/uitls/utils.dart';
import 'package:mvvmloginsignup/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo=AuthRepository();
  bool _loading=false;
  bool get loading=>_loading;

  bool _signUpLoading=false;
  bool get signUpLoading=>_signUpLoading;


  setloading(bool value){
    _loading=value;
    notifyListeners();
  }

  setLoadingSignUp(bool value){
    _signUpLoading=value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data,BuildContext context) async {
    setloading(true);
    _myRepo.loginApi(data).then((value){
      if(kDebugMode){
        setloading(false);
        final userPrefrence=Provider.of<UserViewModel>(context,listen: false);
        userPrefrence.saveUser(
          UserModel(
            token: value['token'].toString()
          ),
        );
        Utils.flushBarErrorMessage("Login Successfully", context);
        Navigator.pushNamed(context, RoutesNames.home);
        print(value.toString());
      }
    }).onError((error,stackTrace){
      setloading(false);
      if(kDebugMode){
        print(error.toString());
      }
    });
  }


  Future<void> signUp(dynamic data,BuildContext context) async {
    setLoadingSignUp(true);
    _myRepo.registerApi(data).then((value){
      if(kDebugMode){
        setLoadingSignUp(false);
        Utils.flushBarErrorMessage("SignUp Successfully", context);
        print(value.toString());
      }
    }).onError((error,stackTrace){
      setLoadingSignUp(false);
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}