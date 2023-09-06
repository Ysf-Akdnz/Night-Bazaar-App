import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/product/wishlist_products_model.dart';
import 'package:prototip/riverpod/wishlist_riverpod.dart';


final wishlistRiverpod = ChangeNotifierProvider(((ref) => WishlistRiverpod()));

class WishlistScreen extends ConsumerStatefulWidget {
  const WishlistScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends ConsumerState<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    var read = ref.read(wishlistRiverpod);
    double screenHeight = MediaQuery.of(context).size.height;
    return wishlistProductsCategories(read.wishlist, screenHeight);
  }

  Widget wishlistProductsCategories(
      WishlistProductsModel model, double screenHeight) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                model.categoryTitle,
                style: GoogleFonts.ptSans(
                  color: Constant.lightPurple,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: SizedBox(
              height: screenHeight,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 270),
                itemCount: model.products.length,
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 7.5, bottom: 7.5),
                scrollDirection: Axis.vertical,
                itemBuilder: ((context, index) {
                  return widget;
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
