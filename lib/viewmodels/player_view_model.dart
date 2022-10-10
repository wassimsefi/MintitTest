import 'package:mintit/models/player.dart';

class PlayerViewModel {
  final Player _Player;

  PlayerViewModel({required Player player}) : _Player = player;

  String get id {
    return _Player.id;
  }

  String get image {
    return _Player.image;
  }

  String get marque {
    return _Player.marque;
  }

  String get name {
    return _Player.name;
  }

  toList() {}
}
