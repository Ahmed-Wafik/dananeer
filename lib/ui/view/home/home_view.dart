import 'package:dananeer_app/ui/view/home/Image-slider.dart';
import 'package:dananeer_app/ui/view/home/home_page.dart';
import 'package:dananeer_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:dananeer_app/Icons/my_flutter_app_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageView extends HomePageState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(title: Text('Dananeer'), elevation: 0.0, actions: <Widget>[
        IconButton(
          icon: Icon(
            NewIcons.shopping_cart,
            size: 28.0,
          ),
          onPressed: () {},
          tooltip: 'My Cart',
        ),
        IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Future<SharedPreferences> preferences =
                  SharedPreferences.getInstance();
              preferences.then((onValue) {
                onValue.setBool(NavigationRoutes.getLogin, false);
              }).then((_) => Navigator.of(context)
                  .pushReplacementNamed(NavigationRoutes.getLogin));
            })
      ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ImageSlider(
            dotSize: 15.0,
            borderColor: Colors.white,
            dotColor: AppColors.primaryColor,
            image: <Widget>[
              Container(
                color: Colors.green,
                child: Center(
                  child: Text(
                    'offer 1',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
              Container(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'offer 2',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
              Container(
                color: Colors.yellow,
                child: Center(
                  child: Text(
                    'offer 3',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Categories',
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            elevation: 5.0,
            child: Container(
                height: 100.0,
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                child: _buildCategories(number: 4, color: Colors.blueAccent)),
          )
        ],
      ),
    );
  }

  Widget _buildCategories({Color color, int number}) => ListView(
        scrollDirection: Axis.horizontal,
        children: List<Widget>.generate(
          number,
          (index) => Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                color: color,
                width: 100.0,
                height: 80.0,
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
              ),
        ),
      );
}
