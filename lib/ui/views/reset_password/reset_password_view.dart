import 'package:dananeer_app/custom_widgets/input_widget.dart';
import 'package:dananeer_app/ui/views/reset_password/reset_password.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends ResetPasswordPageState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  height: 130.0,
                ),
                Text(
                  'Reset your password?',
                  textAlign: TextAlign.center,
                  style: _style(fontSize: 35.0),
                ),
                SizedBox(
                  height: 45.0,
                ),
                Text(
                  'Reset your password?Reset your password?Reset your password?Reset your password?Reset your password?',
                  textAlign: TextAlign.center,
                  style: _style(fontSize: 15.0),
                ),
                SizedBox(
                  height: 70.0,
                ),
                TextInputWidget(
                    validate: (value) =>
                        value == null || value.isEmpty ? 'Invalid input' : null,
                    icon: Icons.email,
                    isPassword: true,
                    hintText: 'Password',
                    keyboardType: TextInputType.text),
                SizedBox(
                  height: 40.0,
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 80.0),
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Text('Conform Password'),
                  onPressed: () {},
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 90.0),
                  color: Colors.lightGreenAccent,
                  textColor: Colors.white,
                  child: Text('Send'),
                  onPressed: () {},
                ),
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
