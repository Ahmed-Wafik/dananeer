import 'package:dananeer_app/custom_widgets/categry_widget.dart';
import 'package:dananeer_app/model/category.dart';
import 'package:dananeer_app/ui/views/select_categories/select_categories_view.dart';
import 'package:flutter/material.dart';

class SelectCategoryView extends SelectCategoryState {
  
   List<Category> list = [Category('Electronics','images/background.jpg',false),
   Category('Helth&Beauty','images/background.jpg',true),
   Category('Gifts','images/background.jpg',true),
   Category('Transportation','images/background.jpg',false),
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Select Category'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10.0,),
          Flexible(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle, color: Colors.grey[200]),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Knowning you better saving you better!',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        'Select Your Sourcing categories',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 7,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 35.0,
                childAspectRatio: 1.8,
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
                children: list.map((item) {
                  return CategoryItem(item);
                }).toList(),
              )),
          Expanded(
              flex: 1,
              child: Center(
                child: RaisedButton(
                  onPressed: () {
                    for (Category item in list) {
                      if (item.isCheck) {
                        print(item.name);
                      }
                    }
                  },
                  color: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 55.0),
                  child: Text('Done',style: TextStyle(color:Colors.white)),
                  shape: StadiumBorder(),
                ),
              ))
        ],
      ),
    );
  }

}
