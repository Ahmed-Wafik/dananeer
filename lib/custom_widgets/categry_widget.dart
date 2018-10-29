import 'package:dananeer_app/model/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final Category categoryItem;

  CategoryItem(Category categoryItem)
      : categoryItem = categoryItem,
        super(key: ObjectKey(categoryItem));

  @override
  CategoryItemState createState() {
    return new CategoryItemState(categoryItem);
  }
}

class CategoryItemState extends State<CategoryItem> {
  final Category categoryItem;

  CategoryItemState(this.categoryItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.5,
      margin: EdgeInsets.only(bottom: 16.0),
      color: Colors.grey.shade300,
      child: InkWell(
        onTap: () {
          setState(() {
            categoryItem.isCheck = !categoryItem.isCheck;
          });
        },
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.check_circle,
                  size: 30.0,
                  color:
                      categoryItem.isCheck ? Colors.deepPurple : Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 37.0, left: 20.0,right: 32.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  categoryItem.name,
                  style: TextStyle(fontSize: 14.0, color: Colors.black,),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  categoryItem.avatarImage,
                  width: 40.0,
                  height: 30.0,
                ))
          ],
        ),
      ),
    );
  }
}
