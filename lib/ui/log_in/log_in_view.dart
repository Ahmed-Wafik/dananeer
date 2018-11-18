import 'package:dananeer_app/custom_widgets/input_widget.dart';
import 'package:dananeer_app/custom_widgets/progress_widget.dart';
import 'package:dananeer_app/ui/log_in/log_in.dart';
import 'package:flutter/material.dart';

class LogInPageView extends LogInPageSate {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.loose,
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/background.jpg'),
                      fit: BoxFit.cover))),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 80.0,
                ),
                Text(
                  'Welcome',
                  textAlign: TextAlign.center,
                  style: _style(fontSize: 35.0),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Text(
                  'Welcome Welcome Welcome Welcome Welcome',
                  textAlign: TextAlign.center,
                  style: _style(fontSize: 16.0),
                ),
                SizedBox(
                  height: 60.0,
                ),
                SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        TextInputWidget(
                            icon: Icons.email,
                            validate: checkInput,
                            hintText: 'E-mail or phone number',
                            onSave: (value) => loginInput.setUserInput = value,
                            currentFocusNode: emailFocus,
                            nextFocusNode: passwordFocus,
                            keyboardType: TextInputType.emailAddress),
                        TextInputWidget(
                          icon: Icons.lock,
                          validate: checkInput,
                          textinputAction: TextInputAction.done,
                          onSave: (value) => loginInput.setUserPassword = value,
                          hintText: 'password',
                          keyboardType: TextInputType.text,
                          currentFocusNode: passwordFocus,
                          isPassword: true,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 90.0),
                  child: Text('Login'),
                  onPressed: !isActive ? submit : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 26.0,
                  width: 26.0,
                  child: isActive ? CustomProgressBar() : Container(),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10.0,
            left: 10.0,
            bottom: 15.0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: InkWell(
                      onTap: () => navigateToForget(),
                      child: Text(
                        'Forget Password?',
                        style:
                            _style(fontSize: 15.0, color: Colors.yellowAccent),
                      ),
                    ),
                  ),
                  SizedBox(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'New user?',
                          style: _style(fontSize: 15.0),
                        ),
                        InkWell(
                          onTap: () => navigateToSignUp(),
                          child: Text(
                            'SignUp',
                            style: _style(
                                fontSize: 16.0, color: Colors.yellowAccent),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
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
