import 'package:flutter/material.dart';
import 'package:mvvmloginsignup/routes/routes.dart';
import 'package:mvvmloginsignup/routes/routes_name.dart';
import 'package:mvvmloginsignup/screens/login_screen.dart';
import 'package:mvvmloginsignup/view_model/user_view_model.dart';
import 'package:mvvmloginsignup/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
        ChangeNotifierProvider(create: (_)=>AuthViewModel()),
        ChangeNotifierProvider(create: (_)=>UserViewModel())
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesNames.splash,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}

