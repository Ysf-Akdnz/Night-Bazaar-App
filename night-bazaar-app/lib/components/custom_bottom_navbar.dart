import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/view/base_scaffold.dart';

class CustomBottomNavbar extends ConsumerWidget {
  const CustomBottomNavbar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(baseScaffoldRiverpod);
    var read = ref.read(baseScaffoldRiverpod);
    return CurvedNavigationBar(
      items: read.items,
      index: watch.currentIndex,
      height: 56,
      backgroundColor: Constant.darkGrey,
      animationDuration: const Duration(milliseconds: 300),
      color: Constant.whiteGrey.withOpacity(0.5),
      onTap: (newPageIndex) {
        if (newPageIndex != watch.currentIndex) {
          // Önceki sayfadan yeni sayfaya animasyonlu geçiş
          read.setCurrentIndex(newPageIndex);
        }
      },
    );
  }
}
