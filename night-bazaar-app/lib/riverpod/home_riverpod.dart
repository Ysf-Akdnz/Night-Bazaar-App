// Bu dosya, kampanya verilerini yönetmek ve görüntülemek için
// kullanılan HomeRiverpod sınıfını içerir.
// Kampanyaların listesi burada tutulur ve bu sınıf ChangeNotifier olarak tanımlanır.

import 'package:flutter/material.dart';
import 'package:prototip/model/home_products_model.dart';
import 'package:prototip/model/product.dart';
import 'package:prototip/view/assets.dart';

class HomeRiverpod extends ChangeNotifier {
  List<String> campaigns = [
    Assets.images.imCampaignsPNG,
    Assets.images.imCampaignsPNG,
    Assets.images.imCampaignsPNG,
  ];

  int campaignsCurrentIndex = 0;

  PageController pageController = PageController(initialPage: 0);

  void setCampaignsIndex(int newPageValue) {
    campaignsCurrentIndex = newPageValue;
    notifyListeners();
  }

  HomeProductsModel hotDeals =
      HomeProductsModel(categoryTitle: "Hot Deals", products: [
    Product(
        image: Assets.images.imC1PNG,
        title: "Apple iMac 24 (2021)",
        price: 1299,
        star: 4.9,
        isSaved: false),
    Product(
        image: Assets.images.imP2PNG,
        title: "Apple iPhone 12 Series",
        price: 1199,
        star: 5.0,
        isSaved: true),
    Product(
        image: Assets.images.imP1PNG,
        title: "Tablet iMac 10",
        price: 799,
        star: 4.4,
        isSaved: false),
    Product(
        image: Assets.images.imW1PNG,
        title: "Apple Watch V1",
        price: 899,
        star: 4.7,
        isSaved: true),
  ]);

  HomeProductsModel mostPopular =
      HomeProductsModel(categoryTitle: "Most Popular", products: [
    Product(
        image: Assets.images.imC1PNG,
        title: "Apple iMac 30 (2022)",
        price: 1199,
        star: 4.7,
        isSaved: true),
    Product(
        image: Assets.images.imP2PNG,
        title: "Apple iPhone 13 Series",
        price: 1299,
        star: 4.5,
        isSaved: false),
    Product(
        image: Assets.images.imP1PNG,
        title: "Apple Tablet V2",
        price: 959,
        star: 4.8,
        isSaved: true),
    Product(
        image: Assets.images.imW2PNG,
        title: "Apple Watch V2",
        price: 899,
        star: 4.9,
        isSaved: false),
  ]);
}
