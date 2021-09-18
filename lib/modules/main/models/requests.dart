class RequestPostTrackBody {
  final String name;
  final String artists;
  final String year;
  final String cover;

  RequestPostTrackBody({
    required this.name,
    required this.artists,
    required this.year,
    required this.cover
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "artist": artists,
    "year": year,
    "cover": cover,
  };
}