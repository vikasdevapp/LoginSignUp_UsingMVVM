import 'package:flutter/material.dart';
import 'package:mvvmloginsignup/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices sc=SplashServices();

  @override
  void initState() {
    super.initState();
    sc.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen',style: Theme.of(context).textTheme.headlineMedium,),
      ),
    );
  }
}
