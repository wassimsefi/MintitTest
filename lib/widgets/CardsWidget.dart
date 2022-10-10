import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mintit/viewmodels/player_view_model.dart';
import 'package:mintit/widgets/NewCard.dart';

import '../utils/size_config.dart';

class CardsWidget extends StatelessWidget {
  final List<PlayerViewModel> players;

  CardsWidget({required this.players});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (BuildContext context, int index) {
        final player = players[index];
        return Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          height: 80,
          width: SizeConfig.screenWidth,
          child: Neumorphic(
              style: const NeumorphicStyle(
                color: Colors.white,
              ),
              child: NewCard(player)),
        );
      },
    );
  }
}
