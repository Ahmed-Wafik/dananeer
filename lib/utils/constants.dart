import 'package:flutter/material.dart';

class AppColors {
  const AppColors();
  static const Color buttonColor = const Color.fromRGBO(184, 209, 56, 1.0);
  static const Color primaryColor = const Color.fromRGBO(97, 26, 91, 1.0);
  static const Color accentColor = const Color.fromRGBO(103, 59, 125, 1.0);
}

class ShowSnackBar {
  showSnackProgress(GlobalKey<ScaffoldState> key,
          {String message, Widget progressWidget}) =>
      key.currentState.showSnackBar(SnackBar(
        content: Row(
          children: <Widget>[Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 4.0),
            child: progressWidget,
          ), Text(message)],
        ),
      ));

  showSnack(GlobalKey<ScaffoldState> key,
          {String message, IconData icon, Color color}) =>
      key.currentState.showSnackBar(SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(message),
            Icon(
              icon,
              size: 25.0,
              color: color,
            )
          ],
        ),
      ));
}

class NavigationRoutes {
  static final String _login = 'login',
      _signup = 'signup',
      _splash = '/',
      _forgetPassword = 'forget_password',
      _resrPassword = 'resr_password',
      _selectCategories = 'select_categories',
      _home = 'home',
      _profileCenter = 'profile_center',
      _petSelect = 'pet',
      _clientID = 'clientID';
  static String get getClientID => _clientID;
  static String get gettPet => _petSelect;
  static String get getLogin => _login;
  static String get getSplash => _splash;
  static String get getforgetPassword => _forgetPassword;
  static String get getResetPassword => _resrPassword;
  static String get getSignUp => _signup;
  static String get getSelectCategories => _selectCategories;
  static String get getHome => _home;
  static String get getProfileCenter => _profileCenter;
}
