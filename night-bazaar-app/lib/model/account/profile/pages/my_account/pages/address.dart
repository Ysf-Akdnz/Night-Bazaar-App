import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototip/constant/constant.dart';

class MyAddress extends StatefulWidget {
  const MyAddress({super.key});

  @override
  State<MyAddress> createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constant.darkGrey,
        elevation: 0,
        title: Text(
          "My Addresses",
          style: Constant.ptSansBold.copyWith(fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.keyboard_arrow_right_rounded,
            color: Constant.lightPurple,
            size: 40,
          ),
          color: Constant.black,
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.warning,
                size: 48.0,
                color: Colors.orange,
              ),
              const SizedBox(height: 16.0),
              Text(
                'No Address Found Yet',
                style: Constant.ptSansNormal.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24.0),
                  decoration: BoxDecoration(
                    color: Constant.greyShade900,
                    border: Border.all(
                      color: Constant.lightPurple.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Add New Address',
                      style: Constant.ptSansNormal
                          .copyWith(color: Constant.white, fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
