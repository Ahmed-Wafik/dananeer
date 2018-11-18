import 'package:dananeer_app/custom_widgets/input_widget.dart';
import 'package:dananeer_app/custom_widgets/progress_widget.dart';
import 'package:dananeer_app/ui/forget_password/forget_password.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends ForgetPasswordPageState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
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
                  'Forget your Password?',
                  textAlign: TextAlign.center,
                  style: _style(fontSize: 35.0),
                ),
                SizedBox(
                  height: 45.0,
                ),
                Text(
                  'Forget your Password?Forget your Password?Forget your Password?Forget your Password?',
                  textAlign: TextAlign.center,
                  style: _style(fontSize: 15.0),
                ),
                SizedBox(
                  height: 70.0,
                ),
                TextInputWidget(
                    controller: controller,
                    textinputAction: TextInputAction.done,
                    validate: checkInput,
                    icon: Icons.email,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress),
                SizedBox(
                  height: 40.0,
                ),
                RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 90.0),
                    color: Colors.lightGreenAccent,
                    textColor: Colors.white,
                    child: Text('Send'),
                    onPressed: () => isActive == false
                        ? checkEmail(controller.text.toString())
                        : null),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isActive ? CustomProgressBar() : Container(),
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
