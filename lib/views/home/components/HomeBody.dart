import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mintit/viewmodels/raning_view_list_model.dart';
import 'package:mintit/widgets/new_card.dart';
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
    RaningListViewModel runningVM = context.watch<RaningListViewModel>();

    return Material(
      color: Colors.white,
      child: Container(
        color: ColorsApp.kPrimaryColor,
        height: MediaQuery.of(context).size.height,
        // width: double.infinity,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                      radius: 50,
                      foregroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage(
                          'assets/images/logo_user.png',
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      richText(24, Colors.white, "Good morning,"),
                      Text("name: ${widget.firstname}"),
                    ],
                  )
                ],
              ),
            ),
            DraggableScrollableSheet(
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                    child: Column(
                      children: [
                        richText(
                            24, ColorsApp.kPrimaryColor, "Top 10 ranking 2021"),
                        const SizedBox(
                          height: 50,
                        ),
                        Expanded(child: _buildList(runningVM))
                      ],
                    ),
                  ),
                );
              },
              initialChildSize: 0.75,
              minChildSize: 0.5,
            ),

            //draggable sheet
          ],
        ),
      ),
    );
  }

  Widget richText(
    double fontSize,
    Color color,
    String text,
  ) {
    return Text.rich(
      TextSpan(
        style: GoogleFonts.inter(
          fontSize: fontSize,
          color: color,
          letterSpacing: 2.000000061035156,
        ),
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w800,
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
        return NewCard(ranings: r.ranings);
      case LoadingStatus.empty:
      default:
        return const Center(
          child: Text("No results found"),
        );
    }
  }
}
