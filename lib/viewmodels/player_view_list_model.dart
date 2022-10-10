import 'package:flutter/material.dart';
import 'package:mintit/services/web_service.dart';
import 'package:mintit/viewmodels/player_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class PlayerListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<PlayerViewModel> players = <PlayerViewModel>[];

  void topPlayer() async {
    players = await listPlayer
        .map((player) => PlayerViewModel(player: player))
        .toList();

    if (players.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}
