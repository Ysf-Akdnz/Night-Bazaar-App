import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prototip/components/custom_appbar.dart';
import 'package:prototip/components/custom_bottom_navbar.dart';
import 'package:prototip/riverpod/base_scaffold_rivepod.dart';

// BaseScaffoldRiverpod değişkenini oluşturmak için Provider kullanıldı.
final baseScaffoldRiverpod =
    ChangeNotifierProvider((ref) => BaseScaffoldRiverpod());

// ignore: use_key_in_widget_constructors
class BaseScaffold extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseScaffoldState();
}

// Genel ekranın state'ini yöneten sınıf.
class _BaseScaffoldState extends ConsumerState<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(),
        bottomNavigationBar: const CustomBottomNavbar(),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: ref.watch(baseScaffoldRiverpod).getSelectedWidget()),
        ),
      ),
    );
  }
}
