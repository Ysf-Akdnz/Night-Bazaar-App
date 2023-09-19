import 'package:cloud_firestore/cloud_firestore.dart';

class CartProduct {
  String docId;
  String image;
  String title;
  int price;
  int quantity;

  CartProduct({
    required this.docId,
    required this.image,
    required this.title,
    required this.price,
    this.quantity = 1,
  });

  factory CartProduct.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;

    // ignore: unnecessary_null_comparison
    if (data == null) {
      // Veri yoksa veya null ise varsayılan değerleri kullanabilirsiniz.
      return CartProduct(
        docId: '',
        image: '',
        title: '',
        price: 0,
        quantity: 1,
      );
    }
    return CartProduct(
      docId: data['productId'] ?? '',
      image: data['image'] ?? '',
      title: data['title'] ?? '',
      price: data['price'] ?? 0,
      quantity: data['quantity'] ?? 1,
    );
  }
}
