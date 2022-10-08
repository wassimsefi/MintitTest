import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mintit/viewmodels/raning_view_model.dart';

import '../utils/size_config.dart';

class NewCard extends StatelessWidget {
  final List<RaningViewModel> ranings;

  NewCard({required this.ranings});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ranings.length,
      itemBuilder: (BuildContext context, int index) {
        final raning = ranings[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 25, 10, 10),
            height: 80,
            width: SizeConfig.screenWidth,
            child: Neumorphic(
              style: const NeumorphicStyle(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(flex: 1, child: Text("" + raning.id)),
                    const Expanded(
                      flex: 1,
                      child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: AssetImage(
                              'assets/images/logo_user_1.png',
                            ),
                          )),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("" + raning.name),
                          Text("" + raning.marque),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
