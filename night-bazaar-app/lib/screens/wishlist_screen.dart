import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/providers/wishlist_service.dart';

class WishlistScreen extends ConsumerStatefulWidget {
  const WishlistScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends ConsumerState<WishlistScreen> {
  String? userId = FirebaseAuth.instance.currentUser?.uid;
  WishlistService wishlistService = WishlistService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Wishlist",
                style: GoogleFonts.ptSans(
                  color: Constant.lightPurple,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
