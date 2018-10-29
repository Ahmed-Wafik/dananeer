import 'package:dananeer_app/ui/views/forget_password/forget_password.dart';
import 'package:dananeer_app/ui/views/home/home_page.dart';
import 'package:dananeer_app/ui/views/log_in/log_in.dart';
import 'package:dananeer_app/ui/views/reset_password/reset_password.dart';
import 'package:dananeer_app/ui/views/select_categories/select_categories_view.dart';
import 'package:dananeer_app/ui/views/sign_up/sign_up.dart';
import 'package:dananeer_app/ui/views/splash/splash.dart';
import 'package:dananeer_app/utils/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        initialRoute: NavigationRoutes.getLogin,
        theme: ThemeData(
           backgroundColor: Colors.white,
            //brightness: Brightness.dark,
            primaryColor: _primaryColor(),
            accentColor: _accentColor(),
            buttonColor: Color.fromRGBO(184, 209, 56, 1.0),
            canvasColor: Colors.grey[300],
            iconTheme: IconThemeData(color: Colors.white, size: 65.0),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
            textTheme: TextTheme(
                body1: _textStyle(fontSize: 14.5, weight: FontWeight.w300),
                title: _textStyle(fontSize: 15.0, weight: FontWeight.w600))),
        routes: {
          //Splash Screen
          '/': (context) => SplashScreen(),
          NavigationRoutes.getLogin: (context) => LogInPage(),
          NavigationRoutes.getSignUp: (context) => SignUpPage(),
          NavigationRoutes.getforgetPassword: (context) => ForgetPasswordPage(),
          NavigationRoutes.getResetPassword: (context) => ResetPasswordPage(),
          NavigationRoutes.getSelectCategories: (context) =>
              SelectCategoriesPage(),
          NavigationRoutes.getHome: (context) => HomePage(),
      //    NavigationRoutes.getProfileCenter: (context) => ProfileCenterPage(),
       //   NavigationRoutes.gettPet: (context) => PetPage(),
        }));

Color _accentColor() => Color.fromRGBO(103, 59, 125, 1.0);

Color _primaryColor() => Color.fromRGBO(97, 26, 91, 1.0);
_textStyle(
        {double fontSize, FontWeight weight, Color textColor = Colors.black}) =>
    TextStyle(color: textColor, fontSize: fontSize, fontWeight: weight);
