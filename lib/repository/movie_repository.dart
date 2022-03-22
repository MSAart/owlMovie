import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:owlmovie/mixins/server.dart';
import 'package:owlmovie/model/movie.dart';

class MovieRepository {
  Future<List<Movie>> getMovie(int page) async {
    http.Response value = await http.get(
      Uri.parse(Server.alamatApi +
          "/3/movie/top_rated?api_key=${Server.apiKey}" +
          "&page=$page"),
    );
    if (value.statusCode == 200) {
      Map<String, dynamic> response = json.decode(value.body);
      List<dynamic> listData = response["results"];
      List<Movie> listMovie =
          listData.map((dynamic element) => Movie.fromMap(element)).toList();
      return listMovie;
    } else {
      throw Exception();
    }
  }
}
