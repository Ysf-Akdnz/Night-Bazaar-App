import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prototip/model/account/loginSignup/singup_model.dart';
import 'package:prototip/view/base_scaffold.dart';
import 'package:prototip/view/splash.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("users");
  final firebaseAuth = FirebaseAuth.instance;

  Future<bool> isUserLoggedIn() async {
    final User? user = firebaseAuth.currentUser;
    return user != null;
  }

  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        _registerUser(
            name: name,
            email: email,
            password: password,
            lastName: ' ',
            birtday: ' ',
            phone: ' ',
            gender: ' ');
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
        Get.to(() => ConnectingSplash()); 
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
    Get.to(() => DisconnectingSplash());
  }

  Future<void> _registerUser(
      {required String name,
      required String email,
      required String password,
      required String lastName,
      required String birtday,
      required String gender,
      required String phone}) async {
    await userCollection.doc().set({
      "name": name,
      "last_name": lastName,
      "email": email,
      "password": password,
      "birtday": birtday,
      "gender": gender,
      "phone": phone,
    });
  }
}
