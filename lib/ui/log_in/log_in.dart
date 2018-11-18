import 'package:dananeer_app/ui/log_in/log_in_view.dart';
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
  static final String _baseUrl = 'http://api.dananeer.net/Client/';
  var _dio = Dio(Options(baseUrl: _baseUrl,));

  final _validate = ValidateInput();

  @protected
  Login loginInput = Login();
  @protected
  bool isActive = false;
  @protected
  FocusNode emailFocus = FocusNode();
  @protected
  FocusNode passwordFocus = FocusNode();
  @protected
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @protected
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  @protected
  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  //Navigation
  @protected
  navigateToSignUp() =>
      Navigator.of(context).pushNamed(NavigationRoutes.getSignUp);
  @protected
  navigateToForget() =>
      Navigator.of(context).pushNamed(NavigationRoutes.getforgetPassword);

  _navigateToHome() => Navigator.of(context)
      .pushNamedAndRemoveUntil(NavigationRoutes.getHome, (routes) => false);

  //Chech Inputs
  @protected//check email, phone, password
  String checkInput(String value) => _validate.validateUsername(value);
 
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

  @protected
  _login(Login obj) {
    print(obj.toJson());
    _dio
        .post('Login',
            data: FormData.from(
              {
                'UserName': obj.getUserInput(),
                'Password': obj.getUserPassword()
              },
            ))
        .then((onValue) {
      if (onValue.data.toString().isNotEmpty) {
         int clientId=onValue.data['Client_ID'];
        print(clientId);
         _loginSuccess(clientId.toString()).then((_) => _navigateToHome());
      } else {
        print('user not found');
        _loginFailed();
      }
    }).whenComplete(() {
      setState(() {
        isActive = false;
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<SharedPreferences> _loginSuccess(String clientId) =>
      preferences.then((onValue) {
        onValue.setBool(NavigationRoutes.getLogin, true);
        onValue.setString('clientID', clientId);
      });

  _loginFailed() {
    ShowSnackBar().showSnack(scaffoldKey,
        message: 'Login is Failed!',
        color: Colors.redAccent,
        icon: Icons.close);
  }
}
