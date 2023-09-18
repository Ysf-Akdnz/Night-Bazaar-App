import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototip/components/custom_buttons.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/providers/auth_service.dart';

class MyMembershipDetails extends StatefulWidget {
  const MyMembershipDetails({super.key});

  @override
  State<MyMembershipDetails> createState() => _MyMembershipDetailsState();
}

class _MyMembershipDetailsState extends State<MyMembershipDetails> {
  Map<String, dynamic>? userProfile;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthDateController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final profile = await AuthService().getUserProfile();
    setState(() {
      userProfile = profile;
      // Firestore ve Authentication'dan gelen bilgileri burada kullanabilirsiniz
      _firstNameController.text = userProfile?['name'] ?? '';
      _lastNameController.text = userProfile?['last_name'] ?? '';
      _emailController.text = userProfile?['email'] ?? '';
      _phoneController.text = userProfile?['phone'] ?? '';
      _birthDateController.text = userProfile?['birtday'] ?? '';
    });
  }

  Future<void> updateUserProfile() async {
    // Kullanıcının güncel bilgilerini burada alın
    final updatedProfile = {
      "name": _firstNameController.text,
      "last_name": _lastNameController.text,
      "email": _emailController.text,
      "phone": _phoneController.text,
      "birtday": _birthDateController.text,
    };

    await AuthService().updateUserProfile(updatedProfile);

    // Güncelleme işlemi tamamlandığında kullanıcıya
    // bildirim veya geri dönüş sağlayabilirsiniz.

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profil bilgileriniz güncellendi"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Constant.darkGrey,
        elevation: 0,
        title: Text(
          "My Membership Details",
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  MembershipBuildTextfield(
                      controller: _firstNameController,
                      textInputType: TextInputType.name,
                      labelText: "Ad"),
                  MembershipBuildTextfield(
                      controller: _lastNameController,
                      textInputType: TextInputType.name,
                      labelText: "Soyad"),
                  MembershipBuildTextfield(
                      controller: _emailController,
                      textInputType: TextInputType.emailAddress,
                      labelText: "E-mail"),
                  MembershipBuildTextfield(
                      controller: _phoneController,
                      textInputType: TextInputType.phone,
                      labelText: "Phone"),
                  MembershipBuildTextfield(
                      controller: _birthDateController,
                      textInputType: TextInputType.datetime,
                      labelText: "Birthday"),
                ],
              ),
              const SizedBox(height: 16.0),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CustomButton(
                          onTap: () => updateUserProfile(), text: "Save"),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () async {
                      // Hesabı silme işlemi için onay iletişim kutusunu göster
                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Dikkat!!!"),
                            content: const Text(
                                "Hesabı silmek istediğinizden emin misiniz? Bu işlem geri alınamaz."),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  // Onaylandı
                                  Navigator.of(context).pop(true);
                                },
                                child: const Text("Evet"),
                              ),
                              TextButton(
                                onPressed: () {
                                  // İptal edildi
                                  Navigator.of(context).pop(false);
                                },
                                child: const Text("Hayır"),
                              ),
                            ],
                          );
                        },
                      );

                      // Kullanıcı onay verdiyse hesabı sil
                      if (confirmed == true) {
                        await AuthService().deleteAccount();

                        // Hesap başarıyla silindiyse kullanıcıyı çıkış yapmış olarak işaretleyin
                        await AuthService().signOut();

                        // Kullanıcıya bir bildirim veya yönlendirme gösterin
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Hesabınız başarıyla silindi."),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Close My Account',
                      style: Constant.font1.copyWith(
                          decoration: TextDecoration.underline,
                          color: Constant.lightPurple),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MembershipBuildTextfield extends StatelessWidget {
  const MembershipBuildTextfield({
    Key? key,
    required this.labelText,
    required this.textInputType,
    required this.controller,
  }) : super(key: key);

  final String labelText;
  final TextInputType textInputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Constant.white),
        keyboardType: textInputType,
        cursorColor: Constant.whitePurple,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Constant.ptSansBold
              .copyWith(color: Constant.lightPurple.withOpacity(0.8)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Constant.whitePurple.withOpacity(0.5),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Constant.nightAmber.withOpacity(.5),
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        ),
      ),
    );
  }
}
