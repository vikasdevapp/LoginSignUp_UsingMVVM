import 'package:flutter/material.dart';
import 'package:mvvmloginsignup/res/components/round_button.dart';
import 'package:mvvmloginsignup/routes/routes.dart';
import 'package:mvvmloginsignup/routes/routes_name.dart';
import 'package:mvvmloginsignup/uitls/utils.dart';
import 'package:mvvmloginsignup/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  ValueNotifier<bool> _obsecurePassword=ValueNotifier<bool>(true);

  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  FocusNode emailFocusNode=FocusNode();
  FocusNode passwordFocusNode=FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _obsecurePassword.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel=Provider.of<AuthViewModel>(context);
    final height=MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                focusNode: emailFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                onFieldSubmitted: (value){
                  Utils.focusToNext(context, emailFocusNode,passwordFocusNode);
                },
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder:(context,value,child){
                    return  TextFormField(
                      controller: _passwordController,
                      obscureText: _obsecurePassword.value,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          suffixIcon: InkWell(
                            onTap: (){
                              _obsecurePassword.value=!_obsecurePassword.value;
                            },
                              child:Icon(
                                 _obsecurePassword.value? Icons.visibility_off_outlined :
                              Icons.visibility
                              ))
                      ),
                    );
                  }
              ),
              SizedBox(height:height* 0.10),
              RoundButton(
                title: 'Login',
                loading: authViewModel.loading,
                onPress: (){
                  if(_emailController.text.isEmpty){
                    Utils.flushBarErrorMessage("Please enter the Email",context);
                  }else if(_passwordController.text.isEmpty){
                    Utils.flushBarErrorMessage("Please enter the Password",context);
                  }else if(_passwordController.text.length<6){
                    Utils.flushBarErrorMessage("Password Should least 6 digit",context);
                  }else{
                    Map data={
                      'email':'eve.holt@reqres.in',
                      'password':'cityslicka',
                    };
                    authViewModel.loginApi(data,context);
                    print("Api Hit");
                  }
                },
              ),
              SizedBox(height: height*0.01),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesNames.signup);
                },
                  child: Text('Dont have and Account? Sign Up')
              ),
            ],
          )),
     );
  }
}
