import 'package:flutter/material.dart';

class AppColors {
  const AppColors();
  static const Color buttonColor = const Color.fromRGBO(184, 209, 56, 1.0);
  static const Color primaryColor = const Color.fromRGBO(97, 26, 91, 1.0);
  static const Color accentColor = const Color.fromRGBO(103, 59, 125, 1.0);

}
// class AppTextStyle{
//   const AppTextStyle();

//   static const TextStyle 
// }

class NavigationRoutes {
  static final String _login = 'login',
      _signup = 'signup',
      _splash='splash',
      _forgetPassword = 'forget_password',
      _resrPassword = 'resr_password',
      _selectCategories = 'select_categories',
      _home = 'home',
      _profileCenter = 'profile_center',
      _petSelect = 'pet';
  static String get gettPet => _petSelect;
  static String get getLogin => _login;
  static String get getSplash=>_splash;
  static String get getforgetPassword => _forgetPassword;
  static String get getResetPassword => _resrPassword;
  static String get getSignUp => _signup;
  static String get getSelectCategories => _selectCategories;
  static String get getHome => _home;
  static String get getProfileCenter => _profileCenter;
}
