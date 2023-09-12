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
}
