import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prototip/model/product/product.dart';

class WishlistService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Kullanıcının UID'sini almak için yardımcı işlev
  String? getCurrentUserUid() {
    final user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    }
    return null;
  }

  Future<void> addToWishlist(Product product) async {
    final userUid = getCurrentUserUid();
    if (userUid != null) {
      final wishlistCollection = FirebaseFirestore.instance
          .collection("users")
          .doc(userUid)
          .collection("wishlist");

      final productData =
          product.toMap(); // Ürün verilerini bir harita (map) olarak al

      await wishlistCollection
          .doc(product.productId)
          .set(productData); // Ürün id'sini kullanarak ekleniyor
    }
  }

  // Ürünü favorilerden kaldırmak için işlev
  Future<void> removeFromWishlist(String productId) async {
    final userUid = getCurrentUserUid();
    if (userUid != null) {
      final wishlistCollection = FirebaseFirestore.instance
          .collection("users")
          .doc(userUid)
          .collection("wishlist");

      await wishlistCollection.doc(productId).delete();
    }
  }

  // Kullanıcının favori ürünlerini çeken işlev
  Future<List<Product>> getWishlistProducts() async {
    final userUid = getCurrentUserUid();
    if (userUid != null) {
      final wishlistCollection = FirebaseFirestore.instance
          .collection("users")
          .doc(userUid)
          .collection("wishlist");

      final wishlistSnapshot = await wishlistCollection.get();
      final List<Product> wishlistProducts = [];

      for (final doc in wishlistSnapshot.docs) {
        final productData = doc.data() as Map<String, dynamic>;
        final product = Product.fromMap(
            productData); // Product sınıfınıza göre bir fabrika metodu eklemeniz gerekebilir
        wishlistProducts.add(product);
      }

      return wishlistProducts;
    }
    throw Exception("Kullanıcı oturumu açmamış.");
  }

  // Kullanıcının favori ürünlerini getiren işlev
  Stream<QuerySnapshot> getWishlist() {
    final userUid = getCurrentUserUid();
    if (userUid != null) {
      final wishlistCollection = FirebaseFirestore.instance
          .collection("users")
          .doc(userUid)
          .collection("wishlist");
      return wishlistCollection.snapshots();
    }
    throw Exception("Kullanıcı oturumu açmamış.");
  }
}
