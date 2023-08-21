import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/product/product.dart';
import 'package:prototip/view/product_detail.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  Product product;

  ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Get.to(
            () => ProductDetail(product: product),
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
                tag: product.image,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Image.asset(
                    product.image,
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
                      child: Text(product.title,
                          style: GoogleFonts.ptSans(
                            color: Constant.lightPurple,
                          )),
                    ),
                    product.isSaved
                        ? const Icon(
                            Icons.bookmark,
                            color: Constant.ligthAmber,
                          )
                        : const Icon(
                            Icons.bookmark_border_rounded,
                            color: Constant.lightPurple,
                          )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 8, bottom: 5),
                child: Text(
                  "\$${product.price}",
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
                        "${product.star}",
                        style: GoogleFonts.ptSans(
                            color: Constant.lightPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
