import 'dart:convert';

import 'package:codelabs_movieapp/models/cast_model.dart';
import 'package:codelabs_movieapp/services/api_key.dart';
import 'package:http/http.dart' as http;

class CastService {
  String baseUrl = 'http://api.themoviedb.org/3/movie';

  Future<List<CastModel>> getCast(id) async {
    var url = "$baseUrl/$id/credits";
    var headers = {
      'Authorization': 'bearer $apiKey',
      'Content-Type': 'application/json',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body)['cast'];
      List<CastModel> casts = [];

      for (var i in data) {
        casts.add(CastModel.fromJson(i));
      }

      return casts;
    } else {
      throw Exception('failed Get Cast!');
    }
  }
}
