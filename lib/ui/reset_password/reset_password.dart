import 'package:dananeer_app/ui/reset_password/reset_password_view.dart';
import 'package:dananeer_app/utils/constants.dart'
    show NavigationRoutes, ShowSnackBar;
import 'package:dananeer_app/utils/validation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  ResetPasswordView createState() => ResetPasswordView();
}

abstract class ResetPasswordPageState extends State<ResetPasswordPage> {
  static final path = 'http://api.dananeer.net/Client/ChangePassword';

  @protected
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @protected
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @protected
  bool isActive = false;
    
  @protected
  final codeFocusNode = FocusNode();
  @protected
  final newPasswordNode = FocusNode();
  @protected
  TextEditingController verifiyController = TextEditingController();

  @protected
  TextEditingController newPaswordController = TextEditingController();

  @protected //check email
  String checkInput(String value) => ValidateInput().validateUsername(value);

  @override
  void dispose() {
    verifiyController.dispose();
    newPaswordController.dispose();
  
    super.dispose();
  }

  @protected
  resetPassword() {
    if (formKey.currentState.validate()) {
      var data = FormData.from({
        'Code': verifiyController.text.toString(),
        'Password': newPaswordController.text.toString()
      });
      setState(() {
        isActive = true;
      });
      Dio().post(path, data: data).then((onValue) {
        print(onValue.data);
        switch (onValue.data) {
          case 'True':
            Navigator.of(context).pushNamedAndRemoveUntil(
                NavigationRoutes.getLogin, (routes) => false);
            break;
          case 'False':
            setState(() {
              isActive = false;
            });
            ShowSnackBar().showSnack(scaffoldKey,
                message: 'Wrong code', color: Colors.red, icon: Icons.vpn_key);
            break;
          default:
        }
      });
    }
  }
}
