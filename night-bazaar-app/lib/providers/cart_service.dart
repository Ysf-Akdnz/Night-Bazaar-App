import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prototip/model/product/cart_product.dart';
import 'package:prototip/model/product/product.dart';

final cartQuantityProvider = StateProvider<int>((ref) => 0);
final cartTotalPriceProvider = StateProvider<int>((ref) => 0);

class CartService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Kullanıcının UID'sini almak için yardımcı işlev
  String? getCurrentUserUid() {
    final user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    }
    return null;
  }

  Future<void> addToCart(Product product) async {
    try {
      final userUid = getCurrentUserUid();
      if (userUid != null) {
        final cartCollection = FirebaseFirestore.instance
            .collection("users")
            .doc(userUid)
            .collection("cart");

        final productData = {
          // Ürünün gerekli olan verileri alınır
          'productId': product.productId,
          'image': product.image,
          'title': product.title,
          'price': product.price,
          'quantity': 1, // Varsayılan değeri 1
        };

        await cartCollection
            .doc(product.productId)
            .set(productData); // Ürün id'sini kullanarak ekleniyor

      }
    } catch (e) {
      print('Ürün eklenirken hata oluştu: $e');
    }
  }

  Future<void> removeFromCart(String productId) async {
    final userUid = getCurrentUserUid();
    if (userUid != null) {
      final cartCollection = FirebaseFirestore.instance
          .collection("users")
          .doc(userUid)
          .collection("cart");

      await cartCollection.doc(productId).delete();
    }
  }

  // Firestore'dan sepete eklenen ürünleri çekmek için özel bir fonksiyon
  Future<List<CartProduct>> fetchCartProducts() async {
    List<CartProduct> cartProducts = [];

    try {
      // Firebase Authentication ile oturum açmış kullanıcının kimliğini alın
      String? userId = FirebaseAuth.instance.currentUser?.uid;

      // Eğer kullanıcı kimliği yoksa boş bir liste döndürün
      if (userId == null) {
        return cartProducts;
      }

      // Firestore'dan kullanıcının sepetindeki ürünleri al
      QuerySnapshot<Map<String, dynamic>> cartSnapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(userId)
          .collection('cart')
          .get();

      for (var cartDoc in cartSnapshot.docs) {
        // cartDoc.id, döküman kimliğini temsil eder
        CartProduct cartProduct = CartProduct.fromFirestore(cartDoc);
        cartProduct.docId =
            cartDoc.id; // Döküman kimliğini alarak CartProduct'a ekleyin
        cartProducts.add(cartProduct);
      }
    } catch (e) {
      print('Veri çekme hatası: $e');
    }

    return cartProducts;
  }

  Future<void> incrementQuantity(String productId) async {
    final userUid = getCurrentUserUid();
    if (userUid != null) {
      final cartCollection = FirebaseFirestore.instance
          .collection("users")
          .doc(userUid)
          .collection("cart");

      final cartDoc = await cartCollection.doc(productId).get();

      if (cartDoc.exists) {
        final currentQuantity = cartDoc.data()?['quantity'] ?? 0;
        await cartCollection
            .doc(productId)
            .update({'quantity': currentQuantity + 1});
      }
    }
  }

  Future<void> decrementQuantity(String productId) async {
    final userUid = getCurrentUserUid();
    if (userUid != null) {
      final cartCollection = FirebaseFirestore.instance
          .collection("users")
          .doc(userUid)
          .collection("cart");

      final cartDoc = await cartCollection.doc(productId).get();

      if (cartDoc.exists) {
        final currentQuantity = cartDoc.data()?['quantity'] ?? 0;
        if (currentQuantity > 1) {
          await cartCollection
              .doc(productId)
              .update({'quantity': currentQuantity - 1});
        }
      }
    }
  }

  // Sepetteki tüm ürünlerin toplam fiyatını hesaplayan fonksiyon
  int calculateTotalPrice(List<CartProduct> cartProducts) {
    int total = 0;

    for (CartProduct product in cartProducts) {
      total += calculateProductTotalPrice(product);
    }

    return total;
  }

  // Bir ürünün toplam fiyatını hesaplayan fonksiyon
  int calculateProductTotalPrice(CartProduct product) {
    // Ürünün fiyatı ile miktarını çarpıp toplam fiyatı hesapla
    return product.price * product.quantity;
  }

}
