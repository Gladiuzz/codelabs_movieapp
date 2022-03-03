import 'dart:convert';

import 'package:codelabs_movieapp/models/movie_model.dart';
import 'package:codelabs_movieapp/services/api_key.dart';
import 'package:http/http.dart' as http;

class MovieService {
  String baseUrl = 'http://api.themoviedb.org/3/movie';

  Future<List<MovieModel>> getMoviePlaying() async {
    var url = "$baseUrl/now_playing";
    var detail;
    var headers = {
      'Authorization': 'bearer $apiKey',
      'Content-Type': 'application/json',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    // print(json.decode(response.body)['results']);

    if (response.statusCode == 200) {
      var data = json.decode(response.body)['results'];
      List<MovieModel> movies = [];
      // print(data.runtimeType);

      for (var item in data) {
        movies.add(MovieModel.fromJson(item));
      }
      movies.forEach((element) {
        detail = getMovieDetail(element.id, movies);
      });

      return detail;
    } else {
      throw Exception('failed Get movie!');
    }
  }

  Future<List<MovieModel>> getMoviePopular() async {
    var url = "$baseUrl/popular";
    var detail;
    var headers = {
      'Authorization': 'bearer $apiKey',
      'Content-Type': 'application/json',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body)['results'];
      List<MovieModel> movies = [];
      // print(data.runtimeType);

      for (var item in data) {
        movies.add(MovieModel.fromJson(item));
      }
      movies.forEach((element) {
        detail = getMovieDetail(element.id, movies);
      });

      return detail;
    } else {
      throw Exception('failed Get movie!');
    }
  }

  Future<List<MovieModel>> getMovieDetail(
      id, List<MovieModel> movieList) async {
    var url = "$baseUrl/$id";
    var headers = {
      'Authorization': 'bearer $apiKey',
      'Content-Type': 'application/json',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var result = Map<String, dynamic>.from(data);
      // List<MovieModel> movies = [];

      // print(result.runtimeType);
      MovieModel item = MovieModel.fromJson(result);

      MovieModel tile =
          movieList.firstWhere((element) => element.id == item.id);
      tile.adult = item.adult;
      tile.backdropPath = item.backdropPath;
      tile.belongsToCollection = item.belongsToCollection;
      tile.budget = item.budget;
      tile.genres = item.genres;
      tile.homepage = item;
      tile.id = item.id;
      tile.imdbId = item.imdbId;
      tile.originalLanguage = item.originalLanguage;
      tile.originalTitle = item.originalTitle;
      tile.overview = item.overview;
      tile.popularity = item.popularity;
      tile.posterPath = item.posterPath;
      tile.productionCompanies = item.productionCompanies;
      tile.productionCountries = item.productionCountries;
      tile.releaseDate = item.releaseDate;
      tile.revenue = item.revenue;
      tile.runtime = item.runtime;
      tile.spokenLanguages = item.spokenLanguages;
      tile.status = item.status;
      tile.tagline = item.tagline;
      tile.title = item.title;
      tile.video = item.video;
      tile.voteAverage = item.voteAverage;
      tile.voteCount = item.voteCount;

      return movieList;
    } else {
      throw Exception('failed Get Detail movie!');
    }
  }
}
