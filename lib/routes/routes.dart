
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvmloginsignup/routes/routes_name.dart';
import 'package:mvvmloginsignup/screens/home_screen.dart';
import 'package:mvvmloginsignup/screens/login_screen.dart';
import 'package:mvvmloginsignup/screens/sign_up_screen.dart';
import 'package:mvvmloginsignup/screens/splash_screen.dart';

class Routes{

  static Route <dynamic> generateRoutes(RouteSettings settings){
    final arguments=settings.arguments;
    switch(settings.name){
      case RoutesNames.home:
        return MaterialPageRoute(builder: (BuildContext context)=>HomeScreen());
      case RoutesNames.splash:
        return MaterialPageRoute(builder: (BuildContext context)=>SplashScreen());
      case RoutesNames.login:
        return MaterialPageRoute(builder: (BuildContext context)=>LoginScreen());
      case RoutesNames.signup:
        return MaterialPageRoute(builder: (BuildContext context)=>SignUpScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No routes defined'),
            ),
          );
        });
    }
  }
}