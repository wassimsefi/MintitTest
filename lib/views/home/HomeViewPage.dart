import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mintit/utils/colors.dart';
import 'package:mintit/utils/size_config.dart';
import 'package:mintit/viewmodels/raning_view_list_model.dart';
import 'package:mintit/views/home/components/HomeBody.dart';
import 'package:mintit/widgets/new_card.dart';
import 'package:provider/provider.dart';

class HomeViewPage extends StatefulWidget {
  static const String routeName = "/home_screen";
  String firstname;
  String lastname;

  HomeViewPage(this.firstname, this.lastname, {super.key});

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RaningListViewModel(),
      child: HomeBody(widget.firstname, widget.lastname),
    );
  }
}
