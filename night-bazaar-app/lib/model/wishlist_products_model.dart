import 'package:prototip/model/product.dart';

class WishlistProductsModel {
  String categoryTitle;
  List<Product> products;
  WishlistProductsModel({
    required this.categoryTitle,
    required this.products,
  });
}