import 'dart:async';
import 'package:dananeer_app/ui/view/splash/splash_view.dart';
import 'package:dananeer_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreenView createState() => SplashScreenView();
}

abstract class SplashScreenState extends State<SplashScreen> {
  @protected
  final int seconds = 2;
  bool isLogIn;

  @override
  void initState() {
    super.initState();
    //  Timer(Duration(seconds: seconds), () {
    //   print('cscdcs');
    //   //return Navigator.of(context).pushReplacementNamed('select_categories');
    // });
      getSharedPreferences();
  }

  getSharedPreferences() {
    Future<SharedPreferences> preferences = SharedPreferences.getInstance();
    preferences.then((onValue) {
      isLogIn = onValue.getBool(NavigationRoutes.getLogin) ?? false;
      print('isFirstLogIn : $isLogIn');
    }).then((_) => isLogIn
        ? _screenNavigation(NavigationRoutes.getHome)
        : _screenNavigation(NavigationRoutes.getSignUp));
  }

  _screenNavigation(String path) {
    Navigator.of(context).pushReplacementNamed(path);
  }
}
