import 'package:dananeer_app/custom_widgets/input_widget.dart';
import 'package:dananeer_app/custom_widgets/progress_widget.dart';
import 'package:dananeer_app/ui/reset_password/reset_password.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends ResetPasswordPageState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        fit: StackFit.loose,
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/background.jpg'),
                      fit: BoxFit.cover))),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),
                Text(
                  'Reset your password?',
                  textAlign: TextAlign.center,
                  style: _style(fontSize: 35.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Reset your password?Reset your password?Reset your password?Reset your password?Reset your password?',
                  textAlign: TextAlign.center,
                  style: _style(fontSize: 15.0),
                ),
                SizedBox(
                  height: 70.0,
                ),
                 SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                TextInputWidget(
                    controller: verifiyController,
                    currentFocusNode: codeFocusNode,
                    nextFocusNode: newPasswordNode,
                    textinputAction: TextInputAction.next,
                    validate: checkInput,
                    icon: Icons.vpn_key,
                    hintText: 'verification code',
                    keyboardType: TextInputType.text),
                SizedBox(
                  height: 5.0,
                ),
                TextInputWidget(
                    controller: newPaswordController,
                    currentFocusNode: newPasswordNode,
                    textinputAction: TextInputAction.done,
                    validate: checkInput,
                    icon: Icons.email,
                    hintText: 'New Password',
                    keyboardType: TextInputType.text),
                 ],
                  ),
                ),
              ),
                SizedBox(
                  height: 40.0,
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 90.0),
                  color: Colors.lightGreenAccent,
                  textColor: Colors.white,
                  disabledColor: Colors.grey[700],
                  disabledElevation: 1.0,
                  elevation: 4.0,
                  child: Text('Change Password'),
                  onPressed: !isActive ? resetPassword : null,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isActive ? CustomProgressBar() : Container(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  TextStyle _style({double fontSize = 25.0, Color color = Colors.white}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
    );
  }
}
