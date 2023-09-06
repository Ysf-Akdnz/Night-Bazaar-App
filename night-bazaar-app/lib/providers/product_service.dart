import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prototip/model/product/product.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Product> _products = [];

  Future<void> getHotDealsProducts() async {
    final querySnapshot = await _firestore
        .collection('products')
        .doc('JZCkqp73d0Z2wYnYx3jZ')
        .collection('hotdealsproducts')
        .get();
    try {} catch (e) {
      print(e);
    }
  
  }

  Future getMostPopularProducts() async {
    _firestore
        .collection('products')
        .doc('JZCkqp73d0Z2wYnYx3jZ')
        .collection('mostpopularproducts')
        .get();
  }
}
