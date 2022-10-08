import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mintit/utils/colors.dart';
import 'package:mintit/viewmodels/raning_view_model.dart';

import '../utils/size_config.dart';

class NewCard extends StatefulWidget {
  RaningViewModel raning;
  NewCard(this.raning, {super.key});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              flex: 1,
              child: richText(15, ColorsApp.kPrimaryColor, widget.raning.id,
                  FontWeight.w900)),
          Expanded(
            flex: 1,
            child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage(
                    "assets/images/${widget.raning.image}.png",
                  ),
                )),
          ),
          SizedBox(
            width: SizeConfig.screenWidth! * 0.05,
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                richText(15, ColorsApp.kcursorColor, widget.raning.name,
                    FontWeight.w900),
                richText(13, ColorsApp.kcursorColor, widget.raning.marque,
                    FontWeight.w200),
              ],
            ),
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
