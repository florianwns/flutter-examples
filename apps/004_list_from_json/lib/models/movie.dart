class Movie {
  final String title;
  final int year;
  final List<String> cast;
  final List<String> genres;

  Movie({this.title, this.year, this.cast, this.genres});

  Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        year = json['year'],
        cast = List<String>.from(json['cast']),
        genres = List<String>.from(json['genres']);

  Map<String, dynamic> toJson() => {
    'title': title,
    'year': year,
    'cast': cast,
    'genres': genres,
  };
}
