import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.white),
        child: new CircularProgressIndicator(
          strokeWidth: 3.0,
        ),
      );
}
