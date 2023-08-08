import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prototip/components/custom_appbar.dart';
import 'package:prototip/components/custom_buttom_navbar.dart';
import 'package:prototip/constant/constant.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constant.darkGrey,
        appBar: CustomAppbar(),
        bottomNavigationBar: CostumButtomNavBar(),
      ),
    );
  }
}
