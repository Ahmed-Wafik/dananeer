import 'package:dananeer_app/custom_widgets/home/home_widgets/Image-slider.dart';
import 'package:dananeer_app/custom_widgets/home/home_widgets/home_special_wdget.dart';
import 'package:dananeer_app/model/category.dart';
import 'package:dananeer_app/model/offer.dart';
import 'package:dananeer_app/model/product.dart';
import 'package:dananeer_app/utils/constants.dart';
import 'package:flutter/material.dart';
import '../home_items/home_items.dart';

class HomeWidgets {
  HomeItems _homeItem = HomeItems();

  buildOffers({List<Offer> promotion}) => ImageSlider(
      dotSize: 14.0,
      borderColor: Colors.white,
      dotColor: Colors.white,
      image: List<Widget>.generate(
        promotion.length,
        (index) => Container(
                child: FadeInImage.assetNetwork(
              image: promotion[index].imagePath,
              placeholder: 'images/loading.gif',
              fit: BoxFit.fill,
            )),
      ));

  buildCategories({List<Category> categories}) {
    // var list = <String>['Glasses', 'Watches', "Bags", 'Dresses', 'accessories'];
    // var colors = <Color>[
    //   Colors.green,
    //   Colors.yellow,
    //   Colors.red,
    //   Colors.blue,
    //   Colors.purple
    // ];
    return Container(
      padding: EdgeInsets.all(3.0),
      constraints: BoxConstraints.expand(height: 110.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          boxShadow: [BoxShadow(blurRadius: 4.0, color: Colors.grey)]),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) =>
            _homeItem.buildCategoryItem(category: categories[index]),
      ),
    );
  }

  //Build suggestion for you
  buildSuggestForyou({List<Product> product, bool showButton = true}) {
    var b2 = GridView.count(
      scrollDirection: Axis.horizontal,
      crossAxisCount: 2,
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 2.5,
      children: List<Widget>.generate(
          product.length, (index) => buildFadeInImage(product, index)),
    );
    return _homeItem.buildSuggestionItem(body: b2, visible: showButton);
  }

  FadeInImage buildFadeInImage(List<Product> product, int index) {
    return FadeInImage.assetNetwork(
      image: product[index].imgPath,
      placeholder: 'images/loading.gif',
      fit: BoxFit.fill,
    );
  }

  buildDealsRecommened({List<Offer> offer}) {
    return _homeItem.buildCommonItem(
        body: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: offer.length >= 2 ? 2 : offer.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          contentPadding: EdgeInsets.only(bottom: 4.0),
          leading: Image.network(
            offer[index].imagePath,
            width: 70.0,
            height: 60.0,
            fit: BoxFit.fill,
          ),
          title: Text('\$500.0'),
          subtitle: Text(offer[index].offerTitle),
        );
      },
    ));
  }

  buildSeasonalProducts({List<Product> product}) {
    var body = GridView.count(
      crossAxisCount: 2,
      childAspectRatio: .679,
      crossAxisSpacing: 2.5,
      mainAxisSpacing: 2.5,
      scrollDirection: Axis.horizontal,
      children: List.generate(
          product.length, (index) => buildFadeInImage(product, index)),
    );
    return _homeItem.buildSeceondItem(body, 'See more', () => print('hello'));
  }

  buildTrendingDeals({List<Offer> offers}) {
    return _homeItem.buildSeceondItem(buildDealsRecommened(offer: offers),
        'See all deals', () => print('hello'));
  }

  buildProductRelatedToFamily({List<Product> product}) => Container(
        color: Colors.grey[300],
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.only(top: 20.0, left: 8.0),
              title: Text(
                '\$200.45',
                style: TextStyle(color: AppColors.primaryColor),
              ),
              subtitle: Text(product[0].title),
              leading: buildFadeInImage(product, 0),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('See more',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w400))),
            )
          ],
        ),
      );

  buildTrenddingDeals() => _homeItem.buildTrendingDeals(
      Container(
        constraints: BoxConstraints.expand(),
        child: Image.asset(
          'images/background.jpg',
          fit: BoxFit.cover,
        ),
      ),
      '80% off coupon');

  buildProdutForSpecialPrice({List<Product> products}) {
    var body = GridView.count(
        padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 4.0),
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 3.0,
        children: List<SpecialPiceWidget>.generate(
            products.length,
            (index) => SpecialPiceWidget(
                  imgPath: products[index].imgPath,
                  productName: products[index].title,
                )));
    return _homeItem.buildSeceondItem(body, 'See more', () => print('hello'),
        height: 390.0);
  }

  buildDealOfDay({List<Offer> offers}) => Container(
        color: Colors.grey[400],
        padding: EdgeInsets.all(10.0),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('Deal of the day'),
              ),
              Image.network(
                offers[0].imagePath,
                fit: BoxFit.fill,
                width: double.infinity,
                height: 160.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 2.0),
                child: Text('Deal details'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 2.0),
                child: Text(
                  '\$255.55',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 2.0),
                child: Text('Ends in 03:53:52'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Divider(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 2.0),
                child: InkWell(
                    onTap: () {},
                    child: Text(
                      'Shop deals',
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
            ],
          ),
        ),
      );
}
