import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class SplashWidget extends StatefulWidget {
  final int seconds;
  final String backgroundImage;
  final String topImage;
  final String bottomImage;
  final dynamic navigationAfterSeconds;

  const SplashWidget(
      {Key key,
      @required this.seconds,
      this.backgroundImage,
      this.topImage,
      this.bottomImage,
      this.navigationAfterSeconds})
      : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: widget.seconds), () {
      print('ssss');

      if (widget.navigationAfterSeconds is String) {
        return Navigator.of(context)
            .pushReplacementNamed(widget.navigationAfterSeconds);
      } else if (widget.navigationAfterSeconds is Widget) {
        return Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => widget.navigationAfterSeconds));
      } else {
        throw ArgumentError(
            'Navigation After Seconds must be a String OR WIDGET');
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'images/background.jpg',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                widget.topImage,
                width: 50.0,
                height: 50.0,
              ),
              SizedBox(height: 10.0,),
              Image.asset(
                widget.bottomImage,
                width: 50.0,
                height: 50.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
