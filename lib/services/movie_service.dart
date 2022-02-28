import 'dart:convert';

import 'package:codelabs_movieapp/services/api_key.dart';
import 'package:http/http.dart' as http;

import '../models/movie_model.dart';

class MovieService {
  String baseUrl = 'http://api.themoviedb.org/3/movie/now_playing';

  Future<List<MovieModel>> getMoviePlaying() async {
    var url = '$baseUrl';
    var headers = {'Authorization': 'bearer ${apiKey}'};

    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<MovieModel> movies = [];

      for (var item in data) {
        movies.add(MovieModel.fromJson(item));
      }

      return movies;
    } else {
      throw Exception('Gagal Get movie!');
    }
  }
}
