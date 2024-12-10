import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  static double averageRating(List<int> rating){
    var avgRating=0;
    for(int i=0;i<rating.length;i++){
      avgRating=avgRating+rating[i];
    }
    return double.parse((avgRating/rating.length).toStringAsFixed(1));
  }

  static focusToNext(BuildContext context, FocusNode current, FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(msg:message,backgroundColor: Colors.blue,textColor: Colors.white,fontSize: 12);
  }

  static flushBarErrorMessage(String message,BuildContext context){
    showFlushbar(context: context, flushbar: Flushbar(
      message: message,
      forwardAnimationCurve: Curves.decelerate,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      padding: EdgeInsets.all(15),
      backgroundColor: Colors.blue,
      messageColor: Colors.black,
      duration: Duration(seconds: 3),
      reverseAnimationCurve: Curves.easeInOut,
      positionOffset: 20,
      icon: Icon(Icons.error,size: 25,color: Colors.white),
    )..show(context)
    );
  }

  static snackBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.red,
          content: Text(message)
      )
    );
  }
}