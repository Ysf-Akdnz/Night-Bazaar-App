import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/components/custom_buttons.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/product/cart_product.dart';
import 'package:prototip/providers/cart_service.dart';
import 'package:prototip/view/assets.dart';
import 'package:prototip/view/checkout_view.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartService cartService = CartService();
  List<CartProduct> cartProduct = [];
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();

    // initState içinde totalPrice'i güncelleyin
    _updateTotalPrice();
  }

  void _updateTotalPrice() async {
    // Sepetteki ürünleri Firestore'dan çekin
    final cartProducts = await cartService.fetchCartProducts();

    // Sepetteki ürünlerin toplam fiyatını hesaplayın
    int newTotalPrice = cartService.calculateTotalPrice(cartProducts);

    // setState kullanarak totalPrice'i güncelleyin
    setState(() {
      totalPrice = newTotalPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        children: [
          Padding(
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
                style: GoogleFonts.ptSans(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          FutureBuilder<List<CartProduct>>(
              future: cartService.fetchCartProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Hata oluştu: ${snapshot.error}'));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Sepetinizde ürün yok'));
                }

                // Sepetteki ürünlerin toplam fiyatını hesaplayın
                totalPrice = cartService.calculateTotalPrice(snapshot.data!);

                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: snapshot.data!.length,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    CartProduct cartProduct = snapshot.data![index];
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
                            Image.network(
                              cartProduct.image,
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
                                      cartProduct.title,
                                      style: Constant.ptSansBold
                                          .copyWith(fontSize: 18),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Text(
                                  "\$${cartProduct.price}",
                                  style: Constant.ptSansBold
                                      .copyWith(fontSize: 24),
                                ),
                                Row(
                                  children: [
                                    Text("Quantity",
                                        style: Constant.ptSansNormal),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        cartService.decrementQuantity(
                                            cartProduct.docId);
                                      },
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: Constant.nightAmber,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.remove,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 7),
                                      child: Text(
                                        cartProduct.quantity.toString(),
                                        style: Constant.ptSansBold
                                            .copyWith(fontSize: 14),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        cartService.incrementQuantity(
                                            cartProduct.docId);
                                      },
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: Constant.nightAmber,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                cartService.removeFromCart(cartProduct.docId);
                              },
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
              }),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: Constant.ptSansBold.copyWith(fontSize: 36),
                ),
                Text(
                  "\$$totalPrice",
                  style: Constant.ptSansBold.copyWith(fontSize: 36),
                )
              ],
            ),
          ),
          CustomButton(
              onTap: () {
                Get.to(() => const CheckoutView(),
                    transition: Transition.rightToLeft);
              },
              text: "Checkout")
        ],
      ),
    );
  }
}
