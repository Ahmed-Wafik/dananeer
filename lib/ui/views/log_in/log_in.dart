import 'package:dananeer_app/ui/views/log_in/log_in_view.dart';
import 'package:dananeer_app/utils/constants.dart';
import 'package:dananeer_app/utils/validation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dananeer_app/model/login_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends StatefulWidget {
  LogInPageView createState() => LogInPageView();
}

abstract class LogInPageSate extends State<LogInPage> {
  Login loginInput = Login();
  final _validate = ValidateInput();
  bool isActive = false;

  @protected
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  //Navigation
  @protected
  navigateToSignUp() => Navigator.of(context).pushNamed('sign_up');
  @protected
  navigateToForget() => Navigator.of(context).pushNamed('forget_password');

  //Chech Inputs
  @protected
  String checkUsername(String value) => _validate.validateUsername(value);
  @protected
  String checkPassword(String value) => _validate.validateUsername(value);

  @protected
  submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      setState(() {
        isActive = true;
      });
      _login(loginInput);
    }
  }

  _login(Login obj) {
    final String _baseUrl = 'http://api.dananeer.net/Client/';
    var _dio = Dio(Options(
      baseUrl: _baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.PLAIN,
    ));
    _dio.post('Login', data: obj.toJson()).then((onValue) {
      onValue.data.toString().isEmpty ? print('null') : print(onValue.data);
  
    }).whenComplete(() {
      setState(() {
        isActive = false;
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  _signUpSuccess() {
    _sharedPreferences(true);
    _showSnackBar('Login is successfully',
        color: Colors.greenAccent, icon: Icons.offline_pin);
  }

  _signUpFailed() {
    _sharedPreferences(false);
    _showSnackBar('Login is Failed!',
        color: Colors.redAccent, icon: Icons.close);
  }

  _sharedPreferences(bool value) {
    preferences.then((onValue) {
      onValue.setBool(NavigationRoutes.getPreferenceLogin, value);
    });
  }

  _showSnackBar(String text, {Color color, IconData icon}) =>
      scaffoldKey.currentState?.showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                  color: color, fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
            Icon(
              icon,
              size: 25.0,
              color: color,
            )
          ],
        ),
      ));
}
