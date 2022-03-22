class Movie {
  late int id;
  late String title;
  late String posterPath;
  late String releaseDate;
  late String overview;

  Movie(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.releaseDate,
      required this.overview});

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
        id: map["id"],
        title: map["title"],
        posterPath: map["poster_path"],
        releaseDate: map["release_date"],
        overview: map["overview"]);
  }
}
