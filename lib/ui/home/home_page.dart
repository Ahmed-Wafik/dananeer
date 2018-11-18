import 'package:dananeer_app/model/category.dart';
import 'package:dananeer_app/model/offer.dart';
import 'package:dananeer_app/model/product.dart';
import 'package:dananeer_app/utils/constants.dart' show NavigationRoutes;
import 'package:flutter/material.dart';
import 'package:dananeer_app/ui/home/home_view.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePageView createState() => HomePageView();
}

abstract class HomePageState extends State<HomePage> {
  static final _baseUrl = 'http://api.dananeer.net/';
  var _dio = Dio(Options(baseUrl: _baseUrl));

  String _clientID;

  Future<SharedPreferences> _preferences = SharedPreferences.getInstance();

  @protected
  List<Product> suggestedProd, giftSuggestion, seasonalProd, familyProd;

  @protected
  List<Offer> offer, promotion;

  @protected
  List<int> categoryID;

  @protected
  List<Category> categories;

  @override
  void initState() {
    super.initState();

    _getClientId()
        .then((_) => getTimePromotion())
        .then((_) => getSelectedCategories())
        .then((_) => getSuggestedForYou()
            .then((_) => getSeasonlaProduct())
            .then((_) => getFamilyProduct())
            .then((_) => getTrendlingDeals())
            .then((_) => getGiftSuggestion())
            .catchError((onError) => print(onError))
            .whenComplete(() => print('done')));
  }

  _getClientId() => _preferences.then((onValue) {
        _clientID = onValue.getString(NavigationRoutes.getClientID) ?? '2';
        print('Client id HOME : $_clientID');
      });

  _getData() => FormData.from({'ClientID': _clientID});

  getSelectedCategories() =>
      _dio.post('Client/PreferencesList', data: _getData()).then((onValue) {
        categoryID = List<int>.from(onValue.data).toList();
        print(Category.getCategoriesById(categoryID).toString());

        setState(() {
          categories = Category.getCategoriesById(categoryID).isEmpty
              ? Category.getAllCategories
              : Category.getCategoriesById(categoryID);
        });
        print(categories.toString());
      });
  Future<ProductList> getSuggestedForYou() => _dio
          .post(
        'Product/SuggestForYou',
        data: _getData(),
      )
          .then((onValue) {
        setState(() {
          suggestedProd = ProductList.fromJson(onValue.data).products;
        });
        print(suggestedProd.toString());
      });
  Future<ProductList> getGiftSuggestion() => _dio
          .post(
        'Product/GiftsIdeas',
        data: _getData(),
      )
          .then((onValue) {
        setState(() {
          giftSuggestion = ProductList.fromJson(onValue.data).products;
        });
        print(suggestedProd.toString());
      });

  Future<ProductList> getSeasonlaProduct() => _dio
          .post(
        'Product/SeasonalProducts',
        data: _getData(),
      )
          .then((onValue) {
        setState(() {
          seasonalProd = ProductList.fromJson(onValue.data).products;
        });
        print(seasonalProd.toString());
      });
  Future<ProductList> getFamilyProduct() => _dio
          .post(
        'Product/ProductsForFamily',
        data: _getData(),
      )
          .then((onValue) {
        setState(() {
          familyProd = ProductList.fromJson(onValue.data).products;
        });
        print(familyProd.toString());
      });

  Future<OfferList> getTimePromotion() =>
      _dio.post('Offer/SensitivePromotions', data: _getData()).then((onValue) {
        setState(() {
          promotion = OfferList.fromJson(onValue.data).offerList;
        });
        print(promotion.toString());
      });
  Future<OfferList> getTrendlingDeals() =>
      _dio.post('Offer/TrendingDeals', data: _getData()).then((onValue) {
        setState(() {
          offer = OfferList.fromJson(onValue.data).offerList;
        });
        print(offer.toString());
      });
}
