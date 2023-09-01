import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:prototip/model/account/profile/components/profile_menu_model.dart';
import 'package:prototip/model/account/profile/components/profile_picture_model.dart';
import 'package:prototip/model/account/profile/pages/help_center.dart';
import 'package:prototip/model/account/profile/pages/my_account/my_account.dart';
import 'package:prototip/model/account/profile/pages/notification.dart';
import 'package:prototip/model/account/profile/pages/settings/settings.dart';
import 'package:prototip/providers/auth_service.dart';
import 'package:prototip/utils/locator.dart';
import 'package:prototip/view/assets.dart';
import 'package:prototip/view/splash.dart';

class Body extends ConsumerWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfilePicture(),
          const SizedBox(height: 5),
          ProfileMenu(
              icon: Assets.icons.profile,
              press: () {
                Get.to(() => const MyAccountPage(),
                    transition: Transition.rightToLeft);
              },
              text: 'My Account'),
          ProfileMenu(
              icon: Assets.icons.bell,
              press: () {
                Get.to(() => const NotificationsPage(),
                    transition: Transition.rightToLeft);
              },
              text: 'Notifications'),
          ProfileMenu(
              icon: Assets.icons.settings,
              press: () {
                Get.to(() => const SettingsPage(),
                    transition: Transition.rightToLeft);
              },
              text: 'Settings'),
          ProfileMenu(
            icon: Assets.icons.helpCenter,
            press: () {
              Get.to(() => const HelpCenterPage(),
                  transition: Transition.rightToLeft);
            },
            text: 'Help Center',
          ),
          ProfileMenu(
            icon: Assets.icons.logOut,
            press: () {
              locator.get<AuthService>().signOut();
              Get.to(() => Splash());
            },
            text: 'Log Out',
          ),
        ],
      ),
    );
  }
}
