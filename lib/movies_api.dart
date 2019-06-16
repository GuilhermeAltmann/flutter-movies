import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movies_app/movie.dart';

String apiKey = 'c5850ed73901b8d268d0898a8a9d8bff';

Future<List<Movie>> fetchMovie() async {

  List<Movie> movies = new List<Movie>();

  final response =
      await http.get('https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&page=1');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.

    Map<String, dynamic> myMap = json.decode(response.body);
    List<dynamic> results = myMap["results"];

    results.forEach((result) {

      movies.add(Movie.fromJson(result));
    });

    final response2 =
      await http.get('https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&page=2');

    Map<String, dynamic> myMap2 = json.decode(response2.body);
    List<dynamic> results2 = myMap2["results"];

    results2.forEach((result2) {

      movies.add(Movie.fromJson(result2));
    });

    return movies;
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}
