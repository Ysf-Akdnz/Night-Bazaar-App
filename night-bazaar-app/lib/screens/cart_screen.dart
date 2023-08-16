import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/components/custom_button.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/view/assets.dart';
import 'package:prototip/view/checkout_view.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        children: [adv(), products(), price(), customButton()],
      ),
    );
  }

  CustomButton customButton() {
    return CustomButton(
        onTap: () {
          Get.to(() => const CheckoutView(), transition: Transition.rightToLeft);
        },
        text: "Checkout");
  }

  Padding adv() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 40,
        decoration: BoxDecoration(
          color: Constant.nightAmber,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "Delivery for FREE until the end of the month",
          style: GoogleFonts.ptSans(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  ListView products() {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: 2,
      padding: const EdgeInsets.symmetric(vertical: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Constant.darkGrey.withOpacity(0.9),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Constant.lightPurple.withOpacity(0.5),
                blurRadius: 5,
              )
            ],
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Assets.images.imC1PNG,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.17,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: 175,
                        child: Text(
                          "Apple iMac 24 (2013)",
                          style: Constant.ptSansBold.copyWith(fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Text(
                      "\$1299",
                      style: Constant.ptSansBold.copyWith(fontSize: 24),
                    ),
                    Row(
                      children: [
                        Text("Quantity", style: Constant.ptSansNormal),
                        const SizedBox(width: 10),
                        quantityButton(icon: Icons.remove, onTap: () {}),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            "1",
                            style: Constant.ptSansBold.copyWith(fontSize: 14),
                          ),
                        ),
                        quantityButton(icon: Icons.add, onTap: () {})
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.clear,
                    color: Constant.lightPurple,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Padding price() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total",
            style: Constant.ptSansBold.copyWith(fontSize: 36),
          ),
          Text(
            "\$2598",
            style: Constant.ptSansBold.copyWith(fontSize: 36),
          )
        ],
      ),
    );
  }

  Widget quantityButton({required IconData icon, required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Constant.nightAmber,
        ),
        child: Center(
          child: Icon(
            icon,
            size: 20,
          ),
        ),
      ),
    );
  }
}
