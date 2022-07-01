const String tableMovie = 'movies';

class MovieField {
  static const String id = 'id';
  static const String title = 'title';
  static const String director = 'director';
  static const String summary = 'summary';
  static const String genre = 'genre';
}

class Movie {
  Movie({
    this.id,
    required this.title,
    required this.director,
    required this.summary,
    required this.genre,
  });

  int? id;
  String title;
  String director;
  String summary;
  String genre;

  Movie copyWith({
    int? id,
    String? title,
    String? director,
    String? summary,
    String? genre,
  }) =>
      Movie(
        id: id ?? this.id,
        title: title ?? this.title,
        director: director ?? this.director,
        summary: summary ?? this.summary,
        genre: genre ?? this.genre,
      );

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        title: json["title"],
        director: json["director"],
        summary: json["summary"],
        genre: json["genre"],
      );

  Map<String, dynamic> toJson() => {
        MovieField.id: id,
        MovieField.title: title,
        MovieField.director: director,
        MovieField.summary: summary,
        MovieField.genre: genre,
      };
}
