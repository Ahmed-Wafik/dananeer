import 'package:dananeer_app/custom_widgets/input_widget.dart';
import 'package:dananeer_app/ui/views/sign_up/sign_up.dart';
import 'package:flutter/material.dart';

class SignUpPageView extends SignUpPageState {
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
                  height: 50.0,
                ),
                Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: _style(fontSize: 35.0),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Text(
                  'Text TextTextTextTextTextTextTextTextTextText',
                  textAlign: TextAlign.center,
                  style: _style(fontSize: 20.0),
                ),
                SizedBox(
                  height: 35.0,
                ),
                SizedBox(
                  height: 25.0,
                ),
                SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        TextInputWidget(
                          onSave: (value) => signup.setPhone = value,
                          validate: (value) => checkPhone(value),
                          icon: Icons.phone,
                          keyboardType: TextInputType.phone,
                          hintText: 'Phone',
                        ),
                        TextInputWidget(
                          onSave: (value) => signup.setEmail = value,
                          validate: (value) => checkEmail(value),
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'E-mail',
                        ),
                        TextInputWidget(
                          onSave: (value) => signup.setPassword = value,
                          validate: (value) => checkPassword(value),
                          icon: Icons.lock,
                          keyboardType: TextInputType.text,
                          hintText: 'Password',
                          controller: passwordController,
                          isPassword: true,
                        ),
                        TextInputWidget(
                            isPassword: true,
                            icon: Icons.lock,
                            keyboardType: TextInputType.text,
                            hintText: 'Conform Password',
                            validate: (value) => checkConformPass(value))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 90.0),
                  color: Colors.lightGreenAccent,
                  child: Text('Sign Up'),
                  textColor: Colors.black,
                  onPressed: submit,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Aleardy have an account?',
                      style: _style(fontSize: 17.0),
                    ),
                    InkWell(
                      onTap: () => navigate(),
                      child: Text(
                        'Login',
                        style:
                            _style(fontSize: 17.5, color: Colors.yellowAccent),
                      ),
                    )
                  ],
                ),
                 SizedBox(
                  height: 10.0,
                ),
                isActive
                    ? new Theme(
                        data: Theme.of(context)
                            .copyWith(accentColor: Colors.white),
                        child: new CircularProgressIndicator(
                          strokeWidth: 3.0,
                        ),
                      )
                    : Container(),
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
