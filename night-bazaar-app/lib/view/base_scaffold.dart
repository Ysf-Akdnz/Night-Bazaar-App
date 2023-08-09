import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prototip/components/custom_appbar.dart';
import 'package:prototip/components/custom_bottom_navbar.dart';
import 'package:prototip/riverpod/base_scaffold_rivepod.dart';

final baseScaffoldRiverpod =
    ChangeNotifierProvider((ref) => BaseScaffoldRiverpod());

class BaseScaffold extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(),
        bottomNavigationBar: CostumBottomNavbar(),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: ref.watch(baseScaffoldRiverpod).getSelectedWidget()),
      ),
    );
  }
}
