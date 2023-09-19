import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/components/product_card.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/product/product.dart';
import 'package:prototip/providers/wishlist_service.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistService wishlistService = WishlistService();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: wishlistService.getWishlistProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Yükleniyor göstergesi

        } else if (snapshot.hasError) {
          return Text("Hata: ${snapshot.error}");
        } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
          return Center(
            child: Text("Favorilerinizde ürün yok."),
          );
        } else {
          final wishlistProducts = snapshot.data as List<Product>;

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Wishlist",
                      style: GoogleFonts.ptSans(
                          color: Constant.lightPurple, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    itemCount: wishlistProducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      mainAxisExtent: 270,
                    ),
                    itemBuilder: (context, index) {
                      final product = wishlistProducts[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ProductCard(
                          productId: product.productId,
                          image: product.image,
                          title: product.title,
                          price: product.price,
                          star: product.star,
                          descTitle: product.descTitle,
                          desc: product.desc,
                          isSaved: true, // Favori ürün olduğunu işaretleyin
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
