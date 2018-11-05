import 'package:dananeer_app/ui/view/forget_password/forget_password_view.dart';
import 'package:dananeer_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  ForgetPasswordView createState() => ForgetPasswordView();
}

abstract class ForgetPasswordPageState extends State<ForgetPasswordPage> {
  static final path = 'http://api.dananeer.net/Client/ResetPassword';

  @protected
  TextEditingController controller = TextEditingController();
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @protected
  checkEmail(String email) {
    Dio().post(path).then((onValue) {
      print(onValue.data);
      _navigation(onValue.data.toString());
    });
  }

  _navigation(String output) {
    switch (output) {
      case 'True':
        Navigator.of(context)
            .pushReplacementNamed(NavigationRoutes.getResetPassword);
        break;
      case 'False':
        _showSankBar();
        break;
    }
  }

  _showSankBar() {
    final snackbar = SnackBar(
      content: Text('This Email not found'),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
