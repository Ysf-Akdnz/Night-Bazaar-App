import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/product/product.dart';
import 'package:prototip/view/product_detail.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final int price;
  final double star;
  final String descTitle;
  final String desc;
  //List<Color> colors;
  final bool isSaved;

  ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.star,
    required this.descTitle,
    required this.desc,
    required this.isSaved,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Get.to(
            () => ProductDetail(
              image,
              title,
              price,
              star,
              descTitle,
              desc,
              isSaved,
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
                  child: Image.network(
                    image,
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
                      child: Text(title,
                          style: GoogleFonts.ptSans(
                            color: Constant.lightPurple,
                          )),
                    ),
                    isSaved
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
                  "\$${price}",
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
                      "${star}",
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
