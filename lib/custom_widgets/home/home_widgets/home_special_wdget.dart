import 'package:flutter/material.dart';

class SpecialPiceWidget extends StatelessWidget {
  final String imgPath;
  final String productName;

  const SpecialPiceWidget({Key key, this.imgPath, this.productName})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: FadeInImage.assetNetwork(
              image: imgPath,
              placeholder: 'images/loading.gif',
            )),
            Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Text(
                '$productName',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[800], fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      );
}
