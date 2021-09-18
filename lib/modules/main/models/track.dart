class Track {
  final String id;
  final String name;
  final String artists;
  final String year;
  final String cover;

  Track({
    required this.id,
    required this.name,
    required this.artists,
    required this.year,
    required this.cover
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
        id: json['id']! as String,
        name: json['name']! as String,
        artists: json['artist']! as String,
        year: json['year']! as String,
        cover: json['cover']! as String
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "artist": artists,
    "year": year,
    "cover": cover,
  };
}