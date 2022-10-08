import '../views/models/Raning.dart';

class RaningViewModel {
  final Raning _Raning;

  RaningViewModel({required Raning raning}) : _Raning = raning;

  String get id {
    return _Raning.id;
  }

  String get image {
    return _Raning.image;
  }

  String get marque {
    return _Raning.marque;
  }

  String get name {
    return _Raning.name;
  }

  toList() {}
}
