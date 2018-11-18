import 'package:dananeer_app/ui/forget_password/forget_password_view.dart';
import 'package:dananeer_app/utils/constants.dart';
import 'package:dananeer_app/utils/validation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  ForgetPasswordView createState() => ForgetPasswordView();
}

abstract class ForgetPasswordPageState extends State<ForgetPasswordPage> {
  static final path = 'http://api.dananeer.net/Client/ResetPassword';

  @protected
  final key = GlobalKey<ScaffoldState>();

  @protected
  TextEditingController controller = TextEditingController();
  @protected
  bool isActive = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @protected //check email
  String checkInput(String value) => ValidateInput().validateUsername(value);
  @protected
  checkEmail(String email) {
    if (controller.text.isNotEmpty) {
      var data = FormData.from({'Email': email});
      setState(() {
        isActive = true;
      });
      Dio().post(path, data: data).then((onValue) {
        print(onValue.data);
        _navigation(onValue.data.toString());
      }).catchError((onError) => print('forget password $onError'));
    }
  }

  _navigation(String output) {
    switch (output) {
      case 'True':
        Navigator.of(context).pushNamed(NavigationRoutes.getResetPassword);
        break;
      case 'False':
        setState(() {
          isActive = false;
        });
        ShowSnackBar()
            .showSnack(key, message: 'Email not found!', icon: Icons.email);
        break;
    }
  }
}
