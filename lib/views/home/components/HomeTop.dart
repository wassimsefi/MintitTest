import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mintit/utils/colors.dart';

class HomeTop extends StatefulWidget {
  String firstname;
  String lastname;
  HomeTop(this.firstname, this.lastname, {super.key});

  @override
  State<HomeTop> createState() => _HomeTopState();
}

class _HomeTopState extends State<HomeTop> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CircleAvatar(
              backgroundColor: ColorsApp.kSecondaryColor,
              radius: 35,
              child: CircleAvatar(
                backgroundColor: ColorsApp.kSecondaryColor,
                radius: 32,
                backgroundImage: AssetImage(
                  'assets/images/logo_user.png',
                ),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              richText(24, Colors.white, "Good morning,", FontWeight.w900),
              richText(15, Colors.white,
                  "${widget.firstname} ${widget.lastname}", FontWeight.w200),
            ],
          ),
        ],
      ),
    );
  }

  Widget richText(
    double fontSize,
    Color color,
    String text,
    FontWeight fontWeight,
  ) {
    return Text.rich(
      TextSpan(
        style: GoogleFonts.inter(
          fontSize: fontSize,
          color: color,
          // letterSpacing: 2.000000061035156,
        ),
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
              color: color,
              fontWeight: fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
