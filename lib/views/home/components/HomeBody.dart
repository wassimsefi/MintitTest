import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mintit/utils/Strings.dart';
import 'package:mintit/utils/error_message.dart';
import 'package:mintit/utils/size_config.dart';
import 'package:mintit/viewmodels/player_view_list_model.dart';
import 'package:mintit/views/home/components/HomeTop.dart';
import 'package:mintit/widgets/CardsWidget.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';

class HomeBody extends StatefulWidget {
  String firstname;
  String lastname;

  HomeBody(this.firstname, this.lastname, {super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    context.read<PlayerListViewModel>().topPlayer();

    final PlayerListViewModel runningVM = context.watch<PlayerListViewModel>();

    return Container(
      color: ColorsApp.kPrimaryColor,
      height: MediaQuery.of(context).size.height,
      // width: double.infinity,
      child: Column(
        children: <Widget>[
          HomeTop(widget.firstname, widget.lastname),
          Expanded(
            child: Container(
              height: SizeConfig.screenHeight!,
              decoration: const BoxDecoration(
                  color: ColorsApp.kSecondaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(20),
                    horizontal: getProportionateScreenWidth(26)),
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(26),
                    ),
                    richText(20, ColorsApp.kPrimaryColor, Strings.homeText,
                        FontWeight.w700),
                    SizedBox(
                      height: getProportionateScreenHeight(26),
                    ),
                    Expanded(child: _buildList(runningVM))
                  ],
                ),
              ),
            ),
          ),

          //draggable sheet
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

  Widget _buildList(PlayerListViewModel r) {
    switch (r.loadingStatus) {
      case LoadingStatus.searching:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return CardsWidget(players: r.players);
      case LoadingStatus.empty:
      default:
        return const Center(
          child: Text(kDataNullError),
        );
    }
  }
}
