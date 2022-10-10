import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mintit/utils/size_config.dart';
import 'package:mintit/viewmodels/raning_view_list_model.dart';
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
    context.read<RaningListViewModel>().topRaning();

    final RaningListViewModel runningVM = context.watch<RaningListViewModel>();

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
                  color: Colors.white,
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
                    richText(24, ColorsApp.kPrimaryColor, "Top 10 ranking 2021",
                        FontWeight.w900),
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

  Widget _buildList(RaningListViewModel r) {
    switch (r.loadingStatus) {
      case LoadingStatus.searching:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return CardsWidget(ranings: r.ranings);
      case LoadingStatus.empty:
      default:
        return const Center(
          child: Text("No results found"),
        );
    }
  }
}
