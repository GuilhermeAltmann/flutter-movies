import 'package:intl/intl.dart';
import 'package:movies_app/models/genre.dart';
class Movie {

  int id;
  String title;
  String posterPath;
  String releasedDate;
  String overview;
  List<Genre> genres = new List<Genre>();


  Movie({this.id, this.title, this.posterPath, this.releasedDate, this.overview});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return new Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      releasedDate: json['release_date'],
      overview: json['overview'],
    );
  }

  void addGenre(Map<String, dynamic> json){

    this.genres.add(new Genre(id: json["id"], name: json["name"]));
  }

  String dateDateReleasedDate(){

    return new DateFormat("dd/MM/yyyy").format(DateTime.parse(this.releasedDate));
  }
}