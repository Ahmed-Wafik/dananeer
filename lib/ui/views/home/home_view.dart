import 'package:dananeer_app/ui/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dananeer_app/Icons/my_flutter_app_icons.dart';

class HomePageView extends HomePageState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar:
          AppBar(title: Icon(Icons.add_box), elevation: 0.0, actions: <Widget>[
        IconButton(
          icon: Icon(
            NewIcons.shopping_cart,
            size: 27.0,
          ),
          onPressed: () {},
          tooltip: 'My Cart',
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              height: 50.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 3.0),
                child: Container(
                  color: Colors.white70,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
