import 'package:dananeer_app/model/category.dart';
import 'package:dananeer_app/utils/constants.dart' show AppColors;
import 'package:flutter/material.dart';

class HomeItems {
  static HomeItems _homeItems = HomeItems.internal();
  HomeItems.internal();
  factory HomeItems() => _homeItems;

  Color _greyColor() => Colors.grey[300];
  EdgeInsets _paddingValue({double value = 8.0}) => EdgeInsets.all(value);

  //Categories
  buildCategoryItem({Category category}) => Card(
        elevation: 5.0,
        child: Container(
          padding: EdgeInsets.all(1.5),
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 3.0)],
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                  image: AssetImage(category.avatarImage), fit: BoxFit.cover)),
          width: 85.0,
          alignment: Alignment.center,
          child: Text(
            category.name,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 13.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      );

  //Suggestion for you
  buildSuggestionItem(
          {Widget body,
          bool visible,
          VoidCallback goLeftAction,
          VoidCallback goRightAction}) =>
      Stack(
        alignment: Alignment.center,
        overflow: Overflow.visible,
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            color: _greyColor(),
            height: 200.0,
          ),
          Center(
            child: Container(
                height: 200.0, margin: _paddingValue(value: 8.0), child: body),
          ),
          visible
              ? Positioned(
                  right: -4.0,
                  child: _suggestionButtons(
                      action: goRightAction,
                      alignment: Alignment.centerRight,
                      icon: Icons.navigate_next))
              : Container(),
          visible
              ? Positioned(
                  left: -4.0,
                  child: _suggestionButtons(
                      action: goLeftAction,
                      alignment: Alignment.centerLeft,
                      icon: Icons.navigate_before))
              : Container()
        ],
      );

  Align _suggestionButtons(
      {VoidCallback action, Alignment alignment, IconData icon}) {
    return Align(
      alignment: alignment,
      child: Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
              color: Colors.grey[600],
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(offset: Offset(1.0, 1.0), blurRadius: 6.0)
              ]),
          child: InkWell(
            onTap: action,
            child: Icon(
              icon,
              size: 22.0,
            ),
          )),
    );
  }

  //Deal of day , Deals recommended for you , Gidt Suggestion
  buildCommonItem({Widget body}) => Container(
        color: _greyColor(),
        padding: _paddingValue(),
        child: body ?? Container(),
      );

//Pick up where you left,
// Trending deals,
// Seasonal product,
//Product related to your family
//Products for special price
  buildSeceondItem(Widget body, String txt, VoidCallback action,
          {double height = 218.0}) =>
      Container(
        color: _greyColor(),
        constraints: BoxConstraints(
          maxHeight: height,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(child: body),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: action,
                child: Text(
                  txt,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.accentColor),
                ),
              ),
            )
          ],
        ),
      );

//Trending deals
  buildTrendingDeals(Widget body, String txt) => Container(
        color: _greyColor(),
        height: 250.0,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: body,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                txt,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.accentColor),
              ),
            )
          ],
        ),
      );
}
