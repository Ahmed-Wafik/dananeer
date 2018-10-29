import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final String labelText;
  final String errorMessage;
  final TextEditingController controller;
  final bool isPassword;
  final ValidateChange validate, onSave;
  final TextInputType keyboardType;
  final Color color = Colors.white;

  const TextInputWidget(
      {Key key,
      this.icon,
      this.hintText,
      this.labelText,
      this.errorMessage,
      this.controller,
      this.isPassword=false,
      this.validate,
      this.onSave,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 42.9,
            width: 55.0,
            child: Icon(
              icon,
              size: 27.0,
              color: color,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.0)),
          ),
          Flexible(
              child: TextFormField(
                keyboardType: keyboardType,
                onSaved: onSave,
                validator: validate,
                obscureText: isPassword,
                controller: controller,
                  decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.white,
            filled: true,
            labelText: labelText,
            errorText: errorMessage,
            hintText: hintText,
          ))),
        ],
      ),
    );
  }
}

typedef ValidateChange(String validate);