/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_log_in/models/cartproduct.dart';
import 'package:firebase_log_in/screens/detail_page.dart';
import 'package:flutter/material.dart';

class ACartPage extends StatefulWidget {
  @override
  State<ACartPage> createState() => _ACartPageState();
}

class _ACartPageState extends State<ACartPage> {
  String? userId = FirebaseAuth.instance.currentUser?.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          'Sepet Sayfası',
          style: TextStyle(color: Colors.black),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Navigator.pushNamed(context, '/Sneakers'),
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
            );
          },
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/homePage');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildFutureBuilder(),
          ),
          _buildButton(),
        ],
      ),
    );
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

  void removeCartItem(String docId) async {
    List<CartProduct> cartProducts = [];
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('cart')
          .doc(docId)
          .delete();

      // Silme işlemi başarılıysa listeyi güncelleyelim
      setState(() {
        cartProducts.removeWhere((product) => product.docId == docId);
      });

      print('Ürün sepetten silindi');
    } catch (e) {
      print('Ürünü sepetten silerken hata oluştu: $e');
    }
  }

  Future<void> updateSize(String docId, String size) async {
    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        print('Kullanıcı oturumu açmamış');
        return;
      }

      // Firestore'daki dokümanın referansını alın
      DocumentReference docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('cart')
          .doc(docId);

      // Boyut alanını güncelleyin
      await docRef.update({
        'size': size,
      });

      print('Boyut başarıyla güncellendi');
    } catch (e) {
      print('Boyut güncelleme hatası: $e');
    }
  }

  Widget _buildFutureBuilder() {
    return FutureBuilder<List<CartProduct>>(
      future: fetchCartProducts(),
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

        // Sepetteki ürünleri listeleme
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            CartProduct cartProduct = snapshot.data![index];
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        price: cartProduct.price,
                        image: cartProduct.imageURL,
                        name: cartProduct.productName,
                      ),
                    ),
                  ).then((result) {
                    // DetailPage'den dönen sonucu kontrol edelim
                    if (result != null && result is String) {
                      // Eğer dönen sonuç bir String ise, boyutu güncellemek için Firestore'a kaydedelim
                      updateSize(cartProduct.docId, result);
                    }
                  });
                },
                //
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(cartProduct.imageURL)),
                title: Text(cartProduct.productName),
                subtitle: Text(
                    'Fiyat: ${cartProduct.price}, Size: ${cartProduct.size}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Ürünü sepetten silmek için removeCartItem fonksiyonunu çağıralım
                    removeCartItem(cartProduct.docId);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildButton() {
    return  GestureDetector(
      onTap: () => Navigator.pushNamed(context,'/Payment'),
      child: Container(
         // padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 10),
          height: 50,
          width: 360,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              'Go to Payment',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20
              ),
            ),
          ),
      ),
    );
  }
}*/