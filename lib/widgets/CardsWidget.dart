import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mintit/viewmodels/raning_view_model.dart';
import 'package:mintit/widgets/NewCard.dart';

import '../utils/size_config.dart';

class CardsWidget extends StatelessWidget {
  final List<RaningViewModel> ranings;

  CardsWidget({required this.ranings});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ranings.length,
      itemBuilder: (BuildContext context, int index) {
        final raning = ranings[index];
        return Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          height: 80,
          width: SizeConfig.screenWidth,
          child: Neumorphic(
              style: const NeumorphicStyle(
                color: Colors.white,
              ),
              child: NewCard(raning)),
        );
      },
    );
  }
}
