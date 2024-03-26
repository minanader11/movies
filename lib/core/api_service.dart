import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/core/api_constants.dart';
import 'package:movies/core/model/MovieCategory.dart';

import 'package:movies/core/model/movie.dart';

class ApiService {
  static Future<Movie> getPopularMovies() async {
    Uri url = Uri.https(ApiConstants.baseURl, ApiConstants.popular);

    try {
      var response = await http
          .get(url, headers: {'Authorization': ApiConstants.authorization});
      var data = jsonDecode(response.body);
      var movies = Movie.fromJson(data);
      return movies;
    } catch (e) {
      throw e;
    }
  }
  static Future<Movie> getReleasesMovies() async {
    Uri url = Uri.https(ApiConstants.baseURl, ApiConstants.releases);

    try {
      var response = await http
          .get(url, headers: {'Authorization': ApiConstants.authorization});
      var data = jsonDecode(response.body);
      var movies = Movie.fromJson(data);
      return movies;
    } catch (e) {
      throw e;
    }
  }
  static Future<Movie> getRecommendedMovies() async {
    Uri url = Uri.https(ApiConstants.baseURl, ApiConstants.recommended);

    try {
      var response = await http
          .get(url, headers: {'Authorization': ApiConstants.authorization});
      var data = jsonDecode(response.body);
      var movies = Movie.fromJson(data);
      return movies;
    } catch (e) {
      throw e;
    }
  }
  static Future<Movie> getSimilarMovies(int id) async {
    Uri url = Uri.https(ApiConstants.baseURl, '3/movie/$id/similar');

    try {
      var response = await http
          .get(url, headers: {'Authorization': ApiConstants.authorization});
      var data = jsonDecode(response.body);
      var movies = Movie.fromJson(data);
      return movies;
    } catch (e) {
      throw e;
    }
  }
  static Future<Movie> getSearchMovies(String movie) async {
    Uri url = Uri.https(ApiConstants.baseURl, ApiConstants.search,{
      'query': movie
    });

    try {
      var response = await http
          .get(url, headers: {'Authorization': ApiConstants.authorization});
      var data = jsonDecode(response.body);
      var movies = Movie.fromJson(data);
      return movies;
    } catch (e) {
      throw e;
    }
  }
  static Future<MovieCategory> getGenres() async {
    Uri url = Uri.https(ApiConstants.baseURl, ApiConstants.genre);

    try {
      var response = await http
          .get(url, headers: {'Authorization': ApiConstants.authorization});
      var data = jsonDecode(response.body);
      var movieCategory = MovieCategory.fromJson(data);
      return movieCategory;
    } catch (e) {
      throw e;
    }
  }
  static Future<Movie> getMoviesByCategory(int id) async {
    Uri url = Uri.https(ApiConstants.baseURl, ApiConstants.moviesByCategory,{
      'with_genres': id.toString()
    }
        );

    try {
      var response = await http
          .get(url, headers: {'Authorization': ApiConstants.authorization});
      var data = jsonDecode(response.body);
      var movies = Movie.fromJson(data);
      return movies;
    } catch (e) {
      throw e;
    }
  }
}
