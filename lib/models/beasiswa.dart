class Beasiswa {
  final String name;
  final String imageUrl;
  final String description;

  Beasiswa({required this.name, required this.imageUrl, required this.description});

  factory Beasiswa.fromJson(Map<String, dynamic> json) {
    return Beasiswa(
      name: json['name'],
      imageUrl: json['owner']['avatar_url'],
      description: json['description'] ?? 'No description available',
    );
  }
}
