import 'package:flutter/material.dart';
import 'package:mintit/models/raning.dart';
import 'package:mintit/services/web_service.dart';
import 'package:mintit/viewmodels/raning_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class RaningListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<RaningViewModel> ranings = <RaningViewModel>[];
  List<Raning> listRaning = [
    Raning(
        id: "1",
        image: "image1",
        name: "Max Verstappen",
        marque: "Red Bull Racing Honda"),
    Raning(
        id: "2", image: "image2", name: "Lewis Hamilton", marque: "Mercedes"),
    Raning(
        id: "3", image: "image3", name: "Valtteri Bottas", marque: "Mercedes"),
    Raning(
        id: "4",
        image: "image4",
        name: "Sergio Perez",
        marque: "Red Bull Racing Honda"),
    Raning(id: "5", image: "image5", name: "Carlos Sainz", marque: "Ferrari"),
    Raning(
        id: "6",
        image: "image6",
        name: "Lando Norris",
        marque: "Mclaren Mercedes"),
    Raning(
        id: "7", image: "image7", name: "Charles Leclerc", marque: "Ferrari"),
    Raning(
        id: "8",
        image: "image8",
        name: "Daniel Ricciardo",
        marque: "Mclaren Mercedes"),
    Raning(
        id: "9",
        image: "image9",
        name: "Pierre Gasly",
        marque: "Alphatauri Honda"),
    Raning(
        id: "10",
        image: "image10",
        name: "Fernando Alonso",
        marque: "Alpine Renault")
  ];

  void topRaning() async {
    ranings = await listRaning
        .map((raning) => RaningViewModel(raning: raning))
        .toList();

    if (ranings.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}
