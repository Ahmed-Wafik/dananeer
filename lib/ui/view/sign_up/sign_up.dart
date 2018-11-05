import 'package:dananeer_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dananeer_app/model/signup_input.dart';
import 'package:dananeer_app/ui/view/sign_up/sign_up_view.dart';
import 'package:dananeer_app/utils/validation.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPageView createState() => SignUpPageView();
}

abstract class SignUpPageState extends State<SignUpPage> {
  static final String _baseUrl = 'http://api.dananeer.net/Client/';
  final _dio = Dio(Options(
    baseUrl: _baseUrl,
    responseType: ResponseType.PLAIN,
  ));

  @protected
  bool isActive = false;
  @protected
  var signup = SignupInput();
  @protected
  final TextEditingController passwordController = TextEditingController();
  @protected
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @protected
  final emailFocusNode = FocusNode();
  @protected
  final phoneFocusNode = FocusNode();
  @protected
  final passwordFocusNode = FocusNode();
  @protected
  final conformPasswordFocusNode = FocusNode();
  @protected
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  @protected
  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  final _validate = ValidateInput();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

//Check Inputs
  @protected
  String checkEmail(String value) => _validate.validateEmail(value.trim());
  @protected
  String checkUsername(String value) =>
      _validate.validateUsername(value.trim());
  @protected
  String checkPassword(String value) =>
      _validate.validatePassword(value.trim());
  @protected
  String checkPhone(String value) => _validate.validatePhone(value.trim());
  @protected
  String checkConformPass(String value) =>
      passwordController.text.trim() != value.trim()
          ? 'Please Conform your password'
          : null;

  //Navigation to another screen
  @protected
  navigate() => Navigator.of(context).pushNamed(NavigationRoutes.getLogin);

  _navigateToCategory() => Navigator.of(context)
      .pushReplacementNamed(NavigationRoutes.getSelectCategories);

  @protected
  submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      setState(() {
        isActive = true;
      });
      print(signup.toString());
      _checkEmailNumber(signup);
    }
  }

  _checkEmailNumber(SignupInput obj) {
    print(obj.toJson());
    _dio.post('CheckEmailPhone', data: obj.toJson()).then((onValue) {
      print(onValue.data);
      int value = onValue.data;
      switch (value) {
        case 0:
          print('new user');
          _signUp(obj);
          break;
        case 1:
          _showSnackBar('Email Exist', color: Colors.red, icon: Icons.email);
          break;
        case 2:
          _showSnackBar('Phone Number Exist',
              color: Colors.red, icon: Icons.phone);
          break;
        case 3:
          _showSnackBar('Email & Phone Number exist',
              color: Colors.red, icon: Icons.close);
          break;
      }
    });
  }

  _signUp(SignupInput obj) {
    _dio.post('SignUp', data: obj.toJson()).then((onValue) {
      print(obj.toString());
      print(onValue.data);
      String value = onValue.data;
      switch (value) {
        case 'True':
          _signUpSuccess();
          break;
        case 'False':
          _signUpSuccess();
          //_signUpFailed();
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
    _sharedPreferences(true).whenComplete(_navigateToCategory);
  }

  _signUpFailed() {
    _showSnackBar('Registration is Failed!',
        color: Colors.redAccent, icon: Icons.close);
  }

  //save bool value on phone memory so when registration is success,
  // it will lead the user to home screen
  // and if the registration is false it will lead him to sign up screen
  Future<SharedPreferences> _sharedPreferences(bool value) =>
      preferences.then((onValue) {
        onValue.setBool(NavigationRoutes.getLogin, value);
      });

  _showSnackBar(String text, {Color color, IconData icon}) =>
      scaffoldKey.currentState.showSnackBar(SnackBar(
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
