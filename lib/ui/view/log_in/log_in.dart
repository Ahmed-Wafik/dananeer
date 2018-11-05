import 'package:dananeer_app/ui/view/log_in/log_in_view.dart';
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
  var _dio = Dio(Options(baseUrl: _baseUrl, headers: {}));

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
  @protected
  navigateToHome() =>
      Navigator.of(context).pushReplacementNamed(NavigationRoutes.getHome);
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
      _getData();
      //_login(loginInput);
    }
  }

  _getData() {
    Dio().post(
      'http://api.dananeer.net/Offer/SensitivePromotions/',
      options: Options(
        responseType: ResponseType.JSON
        
      ),
      data: {'ClientID':3},
    ).then((onValue){
      print(onValue.data);
    });
  }

  @protected
  _login(Login obj) {
    print(obj.toJson());
    _dio.post(
      'Login',
      data: {'UserName': 'a@b.c', 'Password': '0000'},
    ).then((onValue) {
      //onValue.data.toString().isEmpty ? print('null') : print(onValue.data);
      print("id : " + onValue.data.toString());
      //int clientId = onValue.extra['Client_ID'];
      // print('id : $clientId');
      //_loginSuccess();
    }).whenComplete(() {
      setState(() {
        isActive = false;
        // navigateToHome();
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<SharedPreferences> _loginSuccess(int clientId) =>
      _sharedPreferences(true, clientId: clientId);

  _loginFailed() {
    print('null');
    _sharedPreferences(false);
    _showSnackBar('Login is Failed!',
        color: Colors.redAccent, icon: Icons.close);
  }

  _sharedPreferences(bool value, {int clientId}) {
    preferences.then((onValue) {
      onValue.setBool(NavigationRoutes.getLogin, value);
      if (value) onValue.setInt('clientId', clientId);
    });
  }

  _showSnackBar(String text, {Color color, IconData icon}) =>
      scaffoldKey.currentState?.showSnackBar(SnackBar(
        duration: Duration(seconds: 1),
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
