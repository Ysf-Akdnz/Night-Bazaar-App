import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/view/base_scaffold.dart';

// Kendi özelleştirilmiş alt navigasyon çubuğunu oluşturan widget.
class CustomBottomNavbar extends ConsumerWidget {
  const CustomBottomNavbar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(baseScaffoldRiverpod);
    var read = ref.read(baseScaffoldRiverpod);
    return CurvedNavigationBar(
      items: read.items, // Navigasyon çubuğu elemanları.
      index: watch.currentIndex, // Şu an seçili sayfanın indeksi.
      height: 56,
      backgroundColor: Constant.darkGrey,
      animationDuration: const Duration(milliseconds: 300),
      color: Constant.greyShade900.withOpacity(0.5),
      onTap: (newPageIndex) {
        // Yeni sayfaya geçildiğinde çalışan fonksiyon.
        if (newPageIndex != watch.currentIndex) {
          read.setCurrentIndex(newPageIndex);
        }
      },
    );
  }
}
