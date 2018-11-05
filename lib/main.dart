import 'package:dananeer_app/ui/view/forget_password/forget_password.dart';
import 'package:dananeer_app/ui/view/home/home_page.dart';
import 'package:dananeer_app/ui/view/log_in/log_in.dart';
import 'package:dananeer_app/ui/view/reset_password/reset_password.dart';
import 'package:dananeer_app/ui/view/select_categories/select_category.dart';
import 'package:dananeer_app/ui/view/sign_up/sign_up.dart';
import 'package:dananeer_app/ui/view/splash/splash.dart';
import 'package:dananeer_app/utils/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        initialRoute: NavigationRoutes.getSelectCategories,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: AppColors.primaryColor,
            accentColor: AppColors.accentColor,
            buttonColor: AppColors.buttonColor,
            canvasColor: Colors.grey[300],
            iconTheme: IconThemeData(color: Colors.white, size: 20.0),
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

_textStyle(
        {double fontSize, FontWeight weight, Color textColor = Colors.black}) =>
    TextStyle(color: textColor, fontSize: fontSize, fontWeight: weight);
