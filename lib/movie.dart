class Movie {

  int id;
  String title;
  String posterPath;
  String releasedDate;


  Movie({this.id, this.title, this.posterPath, this.releasedDate});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      releasedDate: json['release_date'],
    );
  }
}