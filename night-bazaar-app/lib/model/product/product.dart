import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String productId;
  String image;
  String title;
  int price;
  String star;
  String descTitle;
  String desc;
  //List<Color> colors;
  bool isSaved;

  Product({
    required this.productId,
    required this.image,
    required this.title,
    required this.price,
    required this.star,
    required this.isSaved,
    required this.descTitle,
    required this.desc,
    //required this.colors,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'image': image,
      'title': title,
      'price': price,
      'star': star,
      'descTitle': descTitle,
      'desc': desc,
      'isSaved': isSaved,
    };
  }

  // Fabrika metodu: Map verisini Product nesnesine dönüştürür
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productId'] ?? '',
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      price: map['price'] ?? 0,
      star: map['star'] ?? '',
      descTitle: map['descTitle'] ?? '',
      desc: map['desc'] ?? '',
      isSaved: map['isSaved'] ?? false,
    );
  }

  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;

    if (data == null) {
      // Veri yoksa veya null ise varsayılan değerleri kullanabilirsiniz.
      return Product(
        productId: '',
        image: '',
        title: '',
        price: 0,
        star: '',
        desc: '',
        descTitle: '',
        isSaved: false,
      );
    }

    return Product(
      productId: data['productId'] ?? '',
      image: data['image'] ?? '',
      title: data['title'] ?? '',
      price: data['price'] ?? 0,
      star: data['star'] ?? '',
      desc: data['desc'] ?? '',
      descTitle: data['descTitle'] ?? '',
      isSaved: data['isSaved'] ?? false,
    );
  }
}
