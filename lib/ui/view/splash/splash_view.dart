import 'package:dananeer_app/ui/view/splash/splash.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends SplashScreenState {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.jpg'), fit: BoxFit.cover)),
        child: Center(
            child: Text('Dananeer App',
                style: TextStyle(color: Colors.white, fontSize: 40.0))),
      ),
    );
  }
}
