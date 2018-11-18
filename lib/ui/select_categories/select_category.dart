import 'package:dananeer_app/model/category.dart';
import 'package:dananeer_app/ui/select_categories/select_category_view.dart';
import 'package:dananeer_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectCategoriesPage extends StatefulWidget {
  SelectCategoryView createState() => SelectCategoryView();
}

abstract class SelectCategoryState extends State<SelectCategoriesPage> {
  @protected
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @protected
  bool isLoading = false;

  Future<SharedPreferences> _preferences = SharedPreferences.getInstance();

  String _clientID;
  void initState() {
    super.initState();
    _getClientId();
  }

  //make string object like 1,2,3 ....
  String _getPath(List<Category> selectedCat) {
    var idList = <String>[];
    var data = StringBuffer('');
    for (var i = 0; i < selectedCat.length; i++) {
      if (i != (selectedCat.length - 1))
        idList.add(selectedCat[i].id.toString() + ',');
      else
        idList.add(selectedCat[i].id.toString());
      data.write(idList[i]);
    }
    print(data.toString());
    return data.toString();
  }

  _getClientId() => _preferences.then((onValue) {
        _clientID = onValue.getString(NavigationRoutes.getClientID);
        print("Client id : $_clientID");
      });

  _goToHome() => Navigator.of(context)
      .pushNamedAndRemoveUntil(NavigationRoutes.getHome, (routes) => false);

  sendSelectedCat() {
    String catPath = _getPath(Category().getSelectedCat());
    if (catPath.isEmpty) {
      ShowSnackBar().showSnack(scaffoldKey,
          message: 'Please select at least 3 categories',
          color: Colors.red,
          icon: Icons.close);
    } else {
      setState(() {
        isLoading = true;
      });
      ShowSnackBar().showSnackProgress(
        scaffoldKey,
        message: 'Please wait...',
        progressWidget: CircularProgressIndicator(),
      );
      final path = 'http://api.dananeer.net/Client/SetReferences/';
      var data = FormData.from({
        'ClientID': _clientID,
        'ReferencesID': _getPath(Category().getSelectedCat())
      });
      Dio()
          .post(path, data: data)
          .then((onValue) {
            print(onValue.data);
            String result = onValue.data;
            print(result);
            switch (result) {
              case 'True':
                _goToHome();
                break;
              case 'False':
                ShowSnackBar().showSnack(scaffoldKey,
                    message: 'something is error',
                    color: Colors.red,
                    icon: Icons.error_outline);
                break;
            }
          })
          .catchError((onError) => print('Select category error $onError'))
          .whenComplete(() {
            setState(() {
              isLoading = false;
            });
          });
    }
  }
}
