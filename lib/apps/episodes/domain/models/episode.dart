class Episode {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final DateTime created;

  Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  factory Episode.fromMap(Map<String, dynamic> map) {
    return Episode(
      id: map['id'],
      name: map['name'],
      airDate: map['air_date'],
      episode: map['episode'],
      characters: List<String>.from(map['characters'].map((x) => x)),
      url: map['url'],
      created: DateTime.parse(map['created']),
    );
  }
}
