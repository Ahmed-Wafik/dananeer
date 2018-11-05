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
  final TextInputAction textinputAction;
  FocusNode currentFocusNode = FocusNode();
  FocusNode nextFocusNode = FocusNode();

  TextInputWidget(
      {Key key,
      this.icon,
      this.hintText,
      this.labelText,
      this.errorMessage,
      this.controller,
      this.isPassword = false,
      this.validate,
      this.onSave,
      this.textinputAction = TextInputAction.next,
      this.currentFocusNode,
      this.nextFocusNode,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          icon == null
              ? Container(
                  height: 42.9,
                  width: 55.0,
                  child: Icon(
                    icon,
                    size: 27.0,
                    color: color,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2.0)),
                )
              : Container(),
          Flexible(
              child: TextFormField(
                
                  textInputAction: textinputAction,
                  focusNode: currentFocusNode,
                  onFieldSubmitted: (term) => _fieldFocusChange(
                      context, currentFocusNode, nextFocusNode),
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

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}

typedef ValidateChange(String validate);
