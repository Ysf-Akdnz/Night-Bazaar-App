import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/product/product.dart';
import 'package:prototip/providers/wishlist_service.dart';
import 'package:prototip/view/product_detail.dart';

// ignore: must_be_immutable
class ProductCard extends ConsumerStatefulWidget {
  final String productId;
  final String image;
  final String title;
  final int price;
  final String star;
  final String descTitle;
  final String desc;
  //List<Color> colors;
  final bool isSaved;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.star,
    required this.descTitle,
    required this.desc,
    required this.isSaved,
    required this.productId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductCardState();
}

class _ProductCardState extends ConsumerState<ProductCard> {
  WishlistService wishlistService = WishlistService();
  bool isSaved = false; // Yeni bool değişkeni tanımlanıyor

  @override
  void initState() {
    super.initState();
    checkIfProductIsSaved();
  }

  Future<void> checkIfProductIsSaved() async {
    final userUid = wishlistService.getCurrentUserUid();
    if (userUid != null) {
      final wishlistSnapshot = await wishlistService.getWishlist().first;
      final List<String> productIds =
          wishlistSnapshot.docs.map((doc) => doc.id).toList();
      setState(() {
        isSaved = productIds.contains(widget.productId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Get.to(
            () => ProductDetail(
              widget.productId,
              widget.image,
              widget.title,
              widget.price,
              widget.star,
              widget.descTitle,
              widget.desc,
              isSaved, // Düzeltildi: isSaved kullanılıyor
            ),
            transition: Transition.rightToLeft,
          )),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
            color: Constant.darkGrey.withOpacity(0.9),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Constant.lightPurple.withOpacity(0.5),
                blurRadius: 5,
              )
            ]),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: "image",
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: widget.image.isEmpty
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(50),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(widget.title,
                          style: GoogleFonts.ptSans(
                            color: Constant.lightPurple,
                          )),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final user = FirebaseAuth.instance.currentUser;
                        if (user != null) {
                          // Kullanıcı oturum açmış, favorilere ekleme veya kaldırma işlemini yapabilirsiniz
                          if (isSaved) {
                            setState(() {
                              isSaved = !isSaved;
                            });
                            wishlistService
                                .removeFromWishlist(widget.productId);
                          } else {
                            setState(() {
                              isSaved = !isSaved;
                            });
                            // Ürün verilerini kullanarak Product örneği oluşturun
                            Product productToAdd = Product(
                              productId: widget.productId,
                              image: widget.image,
                              title: widget.title,
                              price: widget.price,
                              star: widget.star,
                              isSaved: isSaved,
                              descTitle: widget.descTitle,
                              desc: widget.desc,
                            );
                            wishlistService.addToWishlist(productToAdd);
                          }
                        } else {
                          // Kullanıcı oturum açmamış, uyarı mesajı gösterin
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Oturum Açınız"),
                                  content: Text(
                                      "Favorilere eklemek için lütfen oturum açınız."),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Kapat"),
                                    ),
                                  ],
                                );
                              });
                        }
                      },
                      child: isSaved
                          ? const Icon(
                              Icons.bookmark,
                              color: Constant.ligthAmber,
                            )
                          : const Icon(
                              Icons.bookmark_border_rounded,
                              color: Constant.lightPurple,
                            ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 8, bottom: 5),
                child: Text(
                  "\$${widget.price}",
                  style: GoogleFonts.ptSans(
                      color: Constant.lightPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star_rate_rounded,
                      color: Constant.amber,
                    ),
                    Text(
                      widget.star,
                      style: GoogleFonts.ptSans(
                          color: Constant.lightPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
