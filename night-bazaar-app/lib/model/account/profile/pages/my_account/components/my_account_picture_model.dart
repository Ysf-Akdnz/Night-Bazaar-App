import 'package:flutter/material.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/view/assets.dart';

class MyAccountPicture extends StatelessWidget {
  const MyAccountPicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: 140,
        width: 140,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(Assets.images.profile),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: SizedBox(
                height: 46,
                width: 46,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Constant.whitePurple.withOpacity(0.8),
                      border: Border.all(
                          color: Constant.lightPurple.withOpacity(0.8),
                          width: 2.0),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Constant.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
