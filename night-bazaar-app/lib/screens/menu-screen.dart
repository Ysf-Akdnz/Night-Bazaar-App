import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototip/constant/constant.dart';
import 'package:prototip/view/assets.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Menu",
          style: GoogleFonts.eduSaBeginner(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30),
        CircleAvatar(
          backgroundColor: Constant.ligthAmber,
          radius: 70,
          child: SvgPicture.asset(
            Assets.icons.icMenuIcon,
            color: Constant.darkGrey,
            width: 50,
          ),
        ),
        Text(
          "Menu Page Content",
          style: GoogleFonts.eduSaBeginner(fontSize: 30, color: Colors.white),
        ),
      ],
    );
  }
}


/*import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            // Burada bir işlev veya sayfa geçişi yapılabilir.
          },
          child: Text('Seçenek 1'),
        ),
        ElevatedButton(
          onPressed: () {
            // Burada bir işlev veya sayfa geçişi yapılabilir.
          },
          child: Text('Seçenek 2'),
        ),
        ElevatedButton(
          onPressed: () {
            // Burada bir işlev veya sayfa geçişi yapılabilir.
          },
          child: Text('Seçenek 3'),
        ),
      ],
    );
  }
}*/
