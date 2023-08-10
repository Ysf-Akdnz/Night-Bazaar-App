// Bu dosya, HomeScreen widget'ını içerir.
// HomeScreen, kampanya resimlerini yatay bir şekilde kaydırılabilir bir liste halinde göstermek için kullanılır.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/components/product_card.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/home_products_model.dart';
import 'package:prototip/riverpod/home_riverpod.dart';

// HomeRiverpod'ı kullanarak bir ChangeNotifierProvider oluşturulur.
final homeRiverpod = ChangeNotifierProvider(((ref) => HomeRiverpod()));

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // HomeRiverpod durumunu izlemek ve okumak için
    // ref.watch ve ref.read kullanılır.
    var watch = ref.watch(homeRiverpod);
    var read = ref.read(homeRiverpod);
    // Ekran yüksekliği hesaplanır.
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: ListView(
        children: [
          // Kampanya resimlerini yatay bir şekilde göstermek için
          // PageView.builder kullanılır.
          Campaigns(screenHeight, read, watch),
          homeProductCategories(read.hotDeals),
          homeProductCategories(read.mostPopular),
        ],
      ),
    );
  }

  Widget homeProductCategories(HomeProductsModel model) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.categoryTitle,
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
        SizedBox(
          height: 270,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: model.products.length,
            padding: const EdgeInsets.only(
                left: 10, right: 10, top: 7.5, bottom: 7.5),
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return ProductCard(product: model.products[index]);
            }),
          ),
        )
      ],
    );
  }

  SizedBox Campaigns(
      double screenHeight, HomeRiverpod read, HomeRiverpod watch) {
    return SizedBox(
      height: screenHeight * 0.3,
      child:
          Stack(children: [CampaignsPageView(read, watch), CampaignsDot(read)]),
    );
  }

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
                margin: EdgeInsets.all(3),
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
