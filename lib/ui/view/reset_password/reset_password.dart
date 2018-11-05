import 'package:dananeer_app/ui/view/reset_password/reset_password_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  ResetPasswordView createState() => ResetPasswordView();
}

abstract class ResetPasswordPageState extends State<ResetPasswordPage> {
  static final path = 'http://api.dananeer.net/Client/ChangePassword';

  @protected
  TextEditingController verifiyController = TextEditingController();

  @protected
  TextEditingController newPaswordController = TextEditingController();

  @override
  void dispose() {
    verifiyController.dispose();
    newPaswordController.dispose();
    super.dispose();
  }

  @protected
  resetPassword() {
    if (verifiyController.text.isNotEmpty ||
        newPaswordController.text.isNotEmpty) {
      Dio().post(path, data: {
        'Code': verifiyController.text.toString(),
        'Password': newPaswordController.text.toString()
      }).then((onValue) {
        print(onValue.data);
      });
    }
  }
}