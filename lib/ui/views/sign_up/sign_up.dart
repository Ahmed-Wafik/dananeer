import 'package:dananeer_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dananeer_app/model/signup_input.dart';
import 'package:dananeer_app/ui/views/sign_up/sign_up_view.dart';
import 'package:dananeer_app/utils/validation.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPageView createState() => SignUpPageView();
}

abstract class SignUpPageState extends State<SignUpPage> {
  bool isActive = false;
  @protected
  SignupInput signup = SignupInput();
  final _validate = ValidateInput();
  final TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @protected
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//Check Inputs
  @protected
  String checkEmail(String value) => _validate.validateEmail(value);
  @protected
  String checkUsername(String value) => _validate.validateUsername(value);
  @protected
  String checkPassword(String value) => _validate.validatePassword(value);
  @protected
  String checkPhone(String value) => _validate.validatePhone(value);
  @protected
  String checkConformPass(String value) =>
      passwordController.text.trim() != value.trim()
          ? 'Please Conform your password'
          : null;
  @protected
  navigate() => Navigator.of(context).pushNamed('login');

  @protected
  submit() {
    // if (formKey.currentState.validate()) {
    //   formKey.currentState.save();
    //   setState(() {
    //     isActive = true;
    //   });
    //   // print(signup.toString());
    //   _signUp(signup);
    // }
    setState(() {
      isActive = true;
    });
    // print(signup.toString());
    _signUp(signup);
  }

  _signUp(SignupInput obj) {
    final String _baseUrl = 'http://api.dananeer.net/Client/';
    var _dio = Dio(Options(
      baseUrl: _baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.PLAIN,
    ));
    _dio.post('SignUp', data: obj.toJson()).then((onValue) {
      print(onValue.data);
      String value = onValue.data;
      switch(value){
        case 'True':
        _signUpSuccess();
        break;
       case 'False':
        _signUpFailed();
        break;
      }
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
    _showSnackBar('Registration is successfully',
        color: Colors.greenAccent, icon: Icons.offline_pin);
  }

  _signUpFailed() {
    _sharedPreferences(false);
    _showSnackBar('Registration is Failed!',
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
