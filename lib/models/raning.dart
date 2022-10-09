class Raning {
  final String id;
  final String image;
  final String name;
  final String marque;

  Raning({
    required this.id,
    required this.image,
    required this.name,
    required this.marque,
  });

  factory Raning.fromJson(Map<String, dynamic> json) {
    return Raning(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      marque: json['marque'],
    );
  }
}
