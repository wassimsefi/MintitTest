import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mintit/utils/colors.dart';
import 'package:mintit/viewmodels/player_view_model.dart';

import '../utils/size_config.dart';

class NewCard extends StatefulWidget {
  PlayerViewModel player;
  NewCard(this.player, {super.key});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(27),
          vertical: getProportionateScreenWidth(12)),
      child: Row(
        children: [
          richText(
              15, ColorsApp.kPrimaryColor, widget.player.id, FontWeight.w900),
          SizedBox(
            width: getProportionateScreenWidth(31),
          ),
          CircleAvatar(
            backgroundColor: ColorsApp.kSecondaryColor,
            radius: 30,
            backgroundImage: AssetImage(
              "assets/images/${widget.player.image}.png",
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(31),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              richText(15, ColorsApp.kcursorColor, widget.player.name,
                  FontWeight.w900),
              richText(13, ColorsApp.kcursorColor, widget.player.marque,
                  FontWeight.w200),
            ],
          )
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
