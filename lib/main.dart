import 'package:dananeer_app/ui/forget_password/forget_password.dart';
import 'package:dananeer_app/ui/home/home_page.dart';
import 'package:dananeer_app/ui/log_in/log_in.dart';
import 'package:dananeer_app/ui/reset_password/reset_password.dart';
import 'package:dananeer_app/ui/select_categories/select_category.dart';
import 'package:dananeer_app/ui/sign_up/sign_up.dart';
import 'package:dananeer_app/ui/splash/splash.dart';
import 'package:dananeer_app/utils/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        initialRoute: NavigationRoutes.getSplash,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          accentColor: AppColors.accentColor,
          buttonColor: AppColors.buttonColor,
          scaffoldBackgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.white, size: 20.0),
        ),
        routes: {
          NavigationRoutes.getSplash: (context) => SplashScreen(),
          NavigationRoutes.getLogin: (context) => LogInPage(),
          NavigationRoutes.getSignUp: (context) => SignUpPage(),
          NavigationRoutes.getforgetPassword: (context) => ForgetPasswordPage(),
          NavigationRoutes.getResetPassword: (context) => ResetPasswordPage(),
          NavigationRoutes.getSelectCategories: (context) =>
              SelectCategoriesPage(),
          NavigationRoutes.getHome: (context) => HomePage(),
        }));
