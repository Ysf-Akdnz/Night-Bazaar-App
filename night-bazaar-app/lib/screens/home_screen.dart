// Bu dosya, HomeScreen widget'ını içerir.
// HomeScreen, kampanya resimlerini yatay bir şekilde kaydırılabilir bir liste halinde göstermek için kullanılır.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/components/product_card.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/product/product.dart';
import 'package:prototip/riverpod/home_riverpod.dart';

// HomeRiverpod'ı kullanarak bir ChangeNotifierProvider oluşturulur.
final homeRiverpod = ChangeNotifierProvider(((ref) => HomeRiverpod()));

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<Product> _hotDealsProducts = [];
  List<Product> _mostPopularProducts = [];

  @override
  void initState() {
    super.initState();
    setState(
      () {
        _getMostPopularProducts();
        _getHotDealsProducts();
      },
    );
  }

  Future<void> _getHotDealsProducts() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection("products")
          .doc("JZCkqp73d0Z2wYnYx3jZ")
          .collection("hotdealsproducts")
          .get();
      setState(() {
        _hotDealsProducts = querySnapshot.docs.map((col) {
          final data = col.data();
          return Product(
            productId: data["productId"],
            image: data["image"],
            title: data["title"],
            price: data["price"],
            star: data["star"],
            isSaved: data["isSaved"],
            descTitle: data["descTitle"],
            desc: data["desc"],
          );
        }).toList();
      });
    } catch (e) {
      // ignore: avoid_print
      print('Firestore veri okuma hatası: $e');
    }
  }

  Future<void> _getMostPopularProducts() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection("products")
          .doc("JZCkqp73d0Z2wYnYx3jZ")
          .collection("mostpopularproducts")
          .get();
      setState(() {
        _mostPopularProducts = querySnapshot.docs.map((col) {
          final data = col.data();
          return Product(
            productId: data["productId"],
            image: data["image"],
            title: data["title"],
            price: data["price"],
            star: data["star"],
            isSaved: data["isSaved"],
            descTitle: data["descTitle"],
            desc: data["desc"],
          );
        }).toList();
      });
    } catch (e) {
      // ignore: avoid_print
      print('Firestore veri okuma hatası: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // HomeRiverpod durumunu izlemek ve okumak için
    // ref.watch ve ref.read kullanılır.
    var watch = ref.watch(homeRiverpod);
    var read = ref.read(homeRiverpod);
    // Ekran yüksekliği hesaplanır.
    double screenHeight = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        Campaigns(screenHeight, read, watch),
        hotDealsProducts(),
        mostPopularProducts(),
      ],
    );
  }

  Column mostPopularProducts() {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Most Popular",
                style: GoogleFonts.ptSans(
                    color: Constant.whitePurple, fontWeight: FontWeight.w600),
              ),
              Text(
                "See All",
                style: GoogleFonts.ptSans(
                  color: Constant.whitePurple.withOpacity(0.38),
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            height: 270,
            child: _mostPopularProducts.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: _mostPopularProducts.length,
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 7.5, bottom: 7.5),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      final mostPopularproduct = _mostPopularProducts[index];
                      return ProductCard(
                          productId: mostPopularproduct.productId,
                          image: mostPopularproduct.image,
                          title: mostPopularproduct.title,
                          price: mostPopularproduct.price,
                          star: mostPopularproduct.star,
                          descTitle: mostPopularproduct.descTitle,
                          desc: mostPopularproduct.desc,
                          isSaved: mostPopularproduct.isSaved);
                    }),
                  ),
          ),
        )
      ],
    );
  }

  Column hotDealsProducts() {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hot Deals",
                style: GoogleFonts.ptSans(
                    color: Constant.whitePurple, fontWeight: FontWeight.w600),
              ),
              Text(
                "See All",
                style: GoogleFonts.ptSans(
                  color: Constant.whitePurple.withOpacity(0.38),
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            height: 270,
            child: _hotDealsProducts.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: _hotDealsProducts.length,
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 7.5, bottom: 7.5),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      final hotDealsproducts = _hotDealsProducts[index];
                      return ProductCard(
                          productId: hotDealsproducts.productId,
                          image: hotDealsproducts.image,
                          title: hotDealsproducts.title,
                          price: hotDealsproducts.price,
                          star: hotDealsproducts.star,
                          descTitle: hotDealsproducts.descTitle,
                          desc: hotDealsproducts.desc,
                          isSaved: hotDealsproducts.isSaved);
                    }),
                  ),
          ),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  SizedBox Campaigns(
      double screenHeight, HomeRiverpod read, HomeRiverpod watch) {
    return SizedBox(
      height: screenHeight * 0.3,
      child:
          Stack(children: [CampaignsPageView(read, watch), CampaignsDot(read)]),
    );
  }

  // ignore: non_constant_identifier_names
  Align CampaignsDot(HomeRiverpod read) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < read.campaigns.length; i++)
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: read.campaignsCurrentIndex == i
                        ? Constant.white
                        : Constant.grey,
                    shape: BoxShape.circle),
              )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  PageView CampaignsPageView(HomeRiverpod read, HomeRiverpod watch) {
    return PageView.builder(
      controller: read.pageController,
      itemCount: read.campaigns.length,
      // Her kampanya resmi Image.asset ile görüntülenir.
      itemBuilder: (context, index) => Image.asset(watch.campaigns[index]),
      onPageChanged: (((newPageValue) => read.setCampaignsIndex(newPageValue))),
    );
  }
}
