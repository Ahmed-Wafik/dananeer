import 'package:dananeer_app/custom_widgets/home/home_widgets/home_widgets.dart';
import 'package:dananeer_app/ui/home/home_page.dart';
import 'package:dananeer_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:dananeer_app/Icons/my_flutter_app_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageView extends HomePageState {
  var _homeWidgets = HomeWidgets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(title: Text('Dananeer'), actions: <Widget>[
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
              }).then((_) => Navigator.of(context).pushNamedAndRemoveUntil(
                  NavigationRoutes.getLogin,
                  ModalRoute.withName(NavigationRoutes.getLogin)));
            })
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: suggestedProd != null &&
                  giftSuggestion != null &&
                  seasonalProd != null &&
                  familyProd != null &&
                  offer != null &&
                  promotion != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    promotion != null
                        ? _homeWidgets.buildOffers(promotion: promotion)
                        : Center(child: CircularProgressIndicator()),

                    _homeTitles(title: "Categories"),
                    categories != null
                        ? _homeWidgets.buildCategories(categories: categories)
                        : Center(child: CircularProgressIndicator()),

                    _homeTitles(title: "Suggestion for you"),
                    suggestedProd != null
                        ? _homeWidgets.buildSuggestForyou(
                            product: suggestedProd)
                        : Center(child: CircularProgressIndicator()),
                    _homeTitles(title: 'Seasonal product'),
                    seasonalProd != null
                        ? _homeWidgets.buildSeasonalProducts(
                            product: seasonalProd)
                        : Center(child: CircularProgressIndicator()),
                    _homeTitles(title: 'Product related to your family'),
                    familyProd != null
                        ? _homeWidgets.buildProductRelatedToFamily(
                            product: familyProd)
                        : Center(child: CircularProgressIndicator()),
                    SizedBox(
                      height: 4.0,
                    ),
                    offer != null
                        ? _homeWidgets.buildDealOfDay(offers: offer)
                        : Center(child: CircularProgressIndicator()),

                    _homeTitles(title: "Trendding deals"),
                    offer != null
                        ? _homeWidgets.buildTrendingDeals(offers: offer)
                        : Center(child: CircularProgressIndicator()),
                    _homeTitles(title: "Suggestion for you"),
                    giftSuggestion != null
                        ? _homeWidgets.buildSuggestForyou(
                            product: giftSuggestion, showButton: false)
                        : Center(child: CircularProgressIndicator()),
                    _homeTitles(title: 'Pruducts for special price'),
                    giftSuggestion != null
                        ? _homeWidgets.buildProdutForSpecialPrice(
                            products: suggestedProd)
                        : Center(child: CircularProgressIndicator()),
                    // _homeTitles(title: 'Deals recommended for you'),
                    // _homeWidgets.buildDealsRecommened(),
                  ],
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Padding _homeTitles({String title}) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: _homeText(text: title),
    );
  }

  Text _homeText({String text}) => Text(
        text,
        style: TextStyle(fontSize: 15.5, color: Colors.grey[850]),
      );
}
