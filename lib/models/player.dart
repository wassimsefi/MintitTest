class Player {
  final String id;
  final String image;
  final String name;
  final String marque;

  Player({
    required this.id,
    required this.image,
    required this.name,
    required this.marque,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      marque: json['marque'],
    );
  }
}
