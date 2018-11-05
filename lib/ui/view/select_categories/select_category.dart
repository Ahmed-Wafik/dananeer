import 'package:dananeer_app/model/category.dart';
import 'package:dananeer_app/ui/view/select_categories/select_category_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SelectCategoriesPage extends StatefulWidget {
  SelectCategoryView createState() => SelectCategoryView();
}

abstract class SelectCategoryState extends State<SelectCategoriesPage> {
  List<Category> list = [
    Category('Electronics', 'images/background.jpg', 1),
    Category('Helth&Beauty', 'images/background.jpg', 2),
    Category('Transportation', 'images/background.jpg', 3),
    Category('Gifts', 'images/background.jpg', 4),
    Category('Transportation', 'images/background.jpg', 5),
    Category('Transportation', 'images/background.jpg', 6),
  ];
  List<Category> _getSelectedCat(List<Category> list) {
    var result = <Category>[];
    for (Category item in list) {
      if (item.isCheck) {
        result.add(item);
      }
    }
    return result;
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

  sendSelectedCat() {
    final path = 'http://api.dananeer.net/Client/SetReferences/';
    var data = FormData.from(
        {'ClientID': 2, 'ReferencesID': _getPath(_getSelectedCat(list))});
    Dio().post(path, data: data).then((onValue) {
      print(onValue.data);
    });
  }
}
