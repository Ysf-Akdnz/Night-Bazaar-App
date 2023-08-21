import 'package:flutter/material.dart';
import 'package:prototip/model/product/wishlist_products_model.dart';

import '../model/product/product.dart';
import '../view/assets.dart';

// İstek listesi ekranını yöneten WishlistRiverpod sınıfı.
class WishlistRiverpod extends ChangeNotifier {
  WishlistProductsModel wishlist =
      WishlistProductsModel(categoryTitle: "My Wishlist", products: [
    // İstek listesi ürünleri
    Product(
        image: Assets.images.imP2PNG,
        title: "Apple iPhone 12 Series",
        price: 1199,
        star: 5.0,
        colors: [Colors.amber, Colors.cyan, Colors.green],
        descTitle: "Description Title",
        desc: "Description",
        isSaved: true),
    Product(
        image: Assets.images.imW1PNG,
        title: "Apple Watch V1",
        price: 899,
        star: 4.7,
        colors: [Colors.amber, Colors.cyan, Colors.green],
        descTitle: "Description Title",
        desc: "Description",
        isSaved: true),
    Product(
        image: Assets.images.imC1PNG,
        title: "Apple iMac 30 (2022)",
        price: 1199,
        star: 4.7,
        colors: [Colors.amber, Colors.cyan, Colors.green],
        descTitle: "Description Title",
        desc: "Description",
        isSaved: true),
    Product(
        image: Assets.images.imP1PNG,
        title: "Apple Tablet V2",
        price: 959,
        star: 4.8,
        colors: [Colors.amber, Colors.cyan, Colors.green],
        descTitle: "Description Title",
        desc: "Description",
        isSaved: true),
  ]);
}
