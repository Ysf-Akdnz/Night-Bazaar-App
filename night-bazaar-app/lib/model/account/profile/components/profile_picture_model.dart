import 'package:flutter/material.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/view/assets.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 180,
        width: 180,
        child: Column(
          children: [
            SizedBox(
              height: 135,
              width: 135,
              child: CircleAvatar(
                backgroundImage: AssetImage(Assets.images.profile),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Yusuf Akdeniz",
                style: Constant.ptSansBold.copyWith(fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
