import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/components/custom_buttons.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/product/product.dart';

// Ürünün detaylarını göstermek için kullanılan widget.
// ignore: must_be_immutable
class ProductDetail extends ConsumerStatefulWidget {
  Product product; // Ürün nesnesini alarak widget'ı oluşturur.
  // ignore: use_key_in_widget_constructors
  ProductDetail({required this.product});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail> {
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
              colors(), // Ürün renklerini gösteren widget.
              subDetail(), // Ürün detayının alt başlığını gösteren widget.
              price(), // Ürün fiyatını gösteren widget.
              button() // Sepete ekleme butonunu içeren widget.
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
          Text("\$${widget.product.price}",
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
        widget.product.title,
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
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Constant.whitePurple,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark_border_rounded,
                color: Constant.whitePurple,
                size: 25,
              ),
            )
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
          Text(widget.product.descTitle, style: _subTitle),
          const SizedBox(height: 8),
          Text(widget.product.desc,
              style: GoogleFonts.ptSans(
                  color: Constant.whitePurple.withOpacity(0.5), fontSize: 17))
        ],
      ),
    );
  }

  Padding colors() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Colors", style: _subTitle),
          const SizedBox(height: 8),
          Wrap(
            spacing: 15,
            children: [
              for (int i = 0; i < widget.product.colors.length; i++)
                Container(
                  width: 107,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.product.colors[i],
                  ),
                ),
            ],
          )
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
            tag: widget.product.image,
            child: Image.asset(
              widget.product.image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}

// Alt başlık stili.
TextStyle _subTitle = GoogleFonts.ptSans(
    fontSize: 17, fontWeight: FontWeight.bold, color: Constant.whitePurple);
