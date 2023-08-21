import 'package:prototip/model/product/product.dart';

class HomeProductsModel {
  String categoryTitle;
  List<Product> products;
  HomeProductsModel({
    required this.categoryTitle,
    required this.products,
  });
}
