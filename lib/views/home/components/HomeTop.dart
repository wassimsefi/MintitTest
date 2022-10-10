import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mintit/utils/colors.dart';
import 'package:mintit/utils/size_config.dart';

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
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(22),
          horizontal: getProportionateScreenWidth(37)),
      child: Row(
        children: [
          Image.asset(
            'assets/images/logo_user.png',
            width: getProportionateScreenWidth(67),
            height: getProportionateScreenHeight(67),
          ),
          SizedBox(
            width: getProportionateScreenWidth(24),
          ),
          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              richText(getProportionateScreenHeight(20), "Good morning,",
                  FontWeight.w700),
              SizedBox(
                height: getProportionateScreenHeight(3),
              ),
              richText(getProportionateScreenHeight(16),
                  "${widget.firstname} ${widget.lastname}", FontWeight.w400),
            ],
          ),
        ],
      ),
    );
  }

  Widget richText(
    double fontSize,
    String text,
    FontWeight fontWeight,
  ) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Rounded',
        fontWeight: fontWeight,
        color: ColorsApp.kSecondaryColor,
        fontSize: fontSize,
      ),
    );
  }
}
