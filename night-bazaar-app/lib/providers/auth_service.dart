import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prototip/view/base_scaffold.dart';
import 'package:prototip/view/splash.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("users");
  final firebaseAuth = FirebaseAuth.instance;

  Future<bool> isUserLoggedIn() async {
    final User? user = firebaseAuth.currentUser;
    return user != null;
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        final String userId = userCredential.user!.uid;
        _registerUser(
            userId: userId,
            name: ' ',
            email: email,
            password: password,
            lastName: ' ',
            birtday: ' ',
            phone: ' ');
        Get.to(() => BaseScaffold());
        login(email: email, password: password);
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        Get.to(() => const ConnectingSplash());
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
    Get.to(() => const DisconnectingSplash());
  }

  Future<void> _registerUser(
      {required String userId,
      required String name,
      required String email,
      required String password,
      required String lastName,
      required String birtday,
      required String phone}) async {
    await userCollection.doc(userId).set({
      "name": name,
      "last_name": lastName,
      "email": email,
      "password": password,
      "birtday": birtday,
      "phone": phone,
    });
  }

  Future<Map<String, dynamic>?> getUserProfile() async {
    final User? user = firebaseAuth.currentUser;
    if (user != null) {
      final DocumentSnapshot snapshot =
          await userCollection.doc(user.uid).get();
      return snapshot.data() as Map<String, dynamic>?;
    }
    return null;
  }

  Future<void> updateUserProfile(Map<String, dynamic> updatedProfile) async {
    final User? user = firebaseAuth.currentUser;
    if (user != null) {
      await userCollection.doc(user.uid).update(updatedProfile);
    }
  }

  Future<void> deleteAccount() async {
    final User? user = firebaseAuth.currentUser;
    if (user != null) {
      // Firestore'daki kullanıcı verilerini sil
      await userCollection.doc(user.uid).delete();

      // Firebase Authentication'dan kullanıcıyı sil
      await user.delete();
    }
  }
}
