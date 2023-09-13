import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/components/custom_buttons.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/product/product.dart';
import 'package:prototip/providers/wishlist_service.dart';

// Ürünün detaylarını göstermek için kullanılan widget.
// ignore: must_be_immutable
class ProductDetail extends ConsumerStatefulWidget {
  final String productId;
  final String image;
  final String title;
  final int price;
  final String star;
  final String descTitle;
  final String desc;
  //List<Color> colors;
  final bool isSaved;
  // ignore: use_key_in_widget_constructors
  const ProductDetail(
    this.productId,
    this.image,
    this.title,
    this.price,
    this.star,
    this.descTitle,
    this.desc,
    this.isSaved,
  );
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail> {
  WishlistService wishlistService = WishlistService();
  bool isSaved = false; // Yeni bool değişkeni tanımlanıyor

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
    return Scaffold(
      backgroundColor: Constant.darkGrey,
      body: Stack(
        children: [
          ListView(
            children: [
              image(), // Ürün renklerini gösteren widget.
              title(), // Ürün başlığını gösteren widget.
              //colors(), // Ürün renklerini gösteren widget.
              subDetail(), // Ürün detayının alt başlığını gösteren widget.
              price(), // Ürün fiyatını gösteren widget.
              button(), // Sepete ekleme butonunu içeren widget.
              const SizedBox(height: 15),
            ],
          ),
          appBar() // Ürün renklerini gösteren widget.
        ],
      ),
    );
  }

  Padding button() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
      child: CustomButton(onTap: () {}, text: "Add to cart"),
    );
  }

  Padding price() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Total",
            style: _subTitle,
          ),
          Text("\$${widget.price}",
              style: GoogleFonts.ptSans(
                  fontSize: 25,
                  color: Constant.whitePurple,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Padding title() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 0),
      child: Text(
        widget.title,
        style: GoogleFonts.ptSans(
            color: Constant.whitePurple,
            fontSize: 28,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  SafeArea appBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => Get.back(closeOverlays: true),
              icon: const Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Constant.whitePurple,
                size: 40,
              ),
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
                    wishlistService.removeFromWishlist(widget.productId);
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
    );
  }

  Padding subDetail() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.descTitle, style: _subTitle),
          const SizedBox(height: 8),
          Text(widget.desc,
              style: GoogleFonts.ptSans(
                  color: Constant.whitePurple.withOpacity(0.5), fontSize: 17))
        ],
      ),
    );
  }

  Padding image() {
    return Padding(
      padding: const EdgeInsets.only(top: 67),
      child: SizedBox(
        height: 380,
        width: double.maxFinite,
        child: Hero(
            tag: widget.image,
            child: Image.network(
              widget.image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}

// Alt başlık stili.
TextStyle _subTitle = GoogleFonts.ptSans(
    fontSize: 17, fontWeight: FontWeight.bold, color: Constant.whitePurple);
