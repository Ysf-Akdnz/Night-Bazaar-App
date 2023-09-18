/*import 'package:flutter/material.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/model/product/cart_product.dart';
import 'package:prototip/model/product/cart_product_widget.dart';
import 'package:prototip/providers/cart_service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartService cartService = CartService();
  List<CartProduct> cartProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<CartProduct>>(
                  future: cartService.fetchCartProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(
                          child: Text('Hata oluştu: ${snapshot.error}'));
                    }

                    if (!snapshot.hasData) {
                      return Center(child: Text('Sepetinizde ürün yok'));
                    }
                    return ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16.0),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return _buildCartItem(cartProducts[index]);
                      },
                    );
                  }),
            ),
            _buildTotalPrice(), // Sepet toplam tutarı gösteren widget
            ElevatedButton(
              onPressed: () {
                // Ödeme işlemi için ilgili işlemleri yapabilirsiniz.
              },
              child: Text('Ödeme Yap'),
            ),
          ],
        ),
      ),
    );
  }

  // Her bir sepet ürününü gösteren widget
  Widget _buildCartItem(CartProduct product) {
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
              product.image,
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
                      product.title,
                      style: Constant.ptSansBold.copyWith(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Text(
                  "\$${product.}",
                  style: Constant.ptSansBold.copyWith(fontSize: 24),
                ),
                Row(
                  children: [
                    Text("Quantity", style: Constant.ptSansNormal),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => () {},
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
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
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Text(
                        "1",
                        style: Constant.ptSansBold.copyWith(fontSize: 14),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => () {},
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
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
  }

  // Sepet toplam tutarını gösteren widget
  Widget _buildTotalPrice() {
    double totalPrice = 0.0;
    for (var product in cartProducts) {
      totalPrice += (product.price * product.quantity);
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Toplam Tutar: \$${totalPrice.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}*/
