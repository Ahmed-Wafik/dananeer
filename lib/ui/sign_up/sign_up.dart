import 'package:dananeer_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dananeer_app/model/signup_input.dart';
import 'package:dananeer_app/ui/sign_up/sign_up_view.dart';
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


  final _validate = ValidateInput();
  final _control = TextEditingController();

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

  @override
  void dispose() {
    passwordController.dispose();
    _control.dispose();
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

  _navigateToCategory() => Navigator.of(context).pushNamedAndRemoveUntil(
      NavigationRoutes.getSelectCategories,
      ModalRoute.withName(NavigationRoutes.getSignUp));

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
    _dio
        .post('CheckEmailPhone', data: FormData.from(obj.toJson()))
        .then((onValue) {
      print('Chech email and number : ' + onValue.data);
      String value = onValue.data;
      switch (value) {
        case '0':
          print('new user');
          _signUp(obj);
          break;
        case '1':
          print('Email exist');
          ShowSnackBar().showSnack(scaffoldKey,
              message: 'Email Exist', color: Colors.red, icon: Icons.email);
          break;
        case '2':
          print('Phone number exist');
          ShowSnackBar().showSnack(scaffoldKey,
              message: 'Phone Number Exist',
              color: Colors.red,
              icon: Icons.phone);
          break;
        case '3':
          print('email and phone number exist');
          ShowSnackBar().showSnack(scaffoldKey,
              message: 'Email & Phone Number exist',
              color: Colors.red,
              icon: Icons.close);
          break;
      }
      setState(() {
        isActive = false;
      });
    }).catchError((onError) =>
            print("Check emai and phone eooro : ${onError.toString()})"));
  }

  _signUp(SignupInput obj) {
    _dio.post('SignUp', data: FormData.from(obj.toJson())).then((onValue) {
      print("Sign up object : ${obj.toString()}");
      print('Sign up response : '+onValue.data);
      String result = onValue.data;
      if (result == 'false') {
        print('user is already sign up');
        _signUpFailed();
      } else {
        String output = result.substring(1, result.length - 1);
        print('client id : $output');
        _acivateUser(output);
      }
    }).whenComplete(() {
      setState(() {
        isActive = false;
      });
    }).catchError((onError) {
      print('sign up error: $onError');
    });
  }

  _acivateUser(String id) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Activate your account'),
              content: TextField(
                controller: _control,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                maxLength: 5,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'activation code',
                    icon: Icon(Icons.verified_user)),
              ),
              actions: <Widget>[
                FlatButton(
                    child: Text(
                      'SEND',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                    onPressed: () {
                      _sendActivateCode(id, _control.text.toString());
                      return showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => Container(
                              alignment: Alignment.center,
                              child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  color: Colors.white,
                                  child: new CircularProgressIndicator())));
                    })
              ],
            ));
  }

  _sendActivateCode(String clientID, String code) => _dio
          .post('ActiveClient',
              data: FormData.from({'ClientID': clientID, 'Code': code}))
          .then((onValue) {
        print(onValue.data);
        String value = onValue.data;
        switch (value) {
          case 'True':
            Navigator.pop(context);
            _activationSuccess();
            Future.delayed(
                Duration(seconds: 2),
                () => _sharedPreferences(true, clientID)
                    .then((_) => _navigateToCategory()));
            break;
          case 'False':
            Navigator.pop(context);
            _activationFailed();
            break;
        }
      }).catchError((onError) => print("activate user error : $onError"));
 
  _activationSuccess() {
    return showDialog(
        context: context,
        builder: (c) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Icon(
                      Icons.error,
                      color: Colors.green,
                    ),
                  ),
                  Text('Success'),
                ],
              ),
              content: Text('Your account is activated'),
            ));
  }

  _activationFailed() {
    return showDialog(
        context: context,
        builder: (c) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    ),
                  ),
                  Text('Error!'),
                ],
              ),
              content: Text('Wrong Activation code!'),
            ));
  }

  _signUpFailed() {
    ShowSnackBar().showSnack(scaffoldKey,
        message: 'Registration is Failed!',
        color: Colors.redAccent,
        icon: Icons.close);
  }

  //save bool value on phone memory so when registration is success,
  // it will lead the user to home screen
  // and if the registration is false it will lead him to sign up screen
  Future<SharedPreferences> _sharedPreferences(bool value, String id) =>
      preferences.then((onValue) {
        onValue.setBool(NavigationRoutes.getLogin, value);
        onValue.setString(NavigationRoutes.getClientID, id);
      });
}
