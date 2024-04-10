import 'package:flutter/material.dart';

import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:peliculas/models/models.dart';

class MoviesProvider  extends ChangeNotifier{
  
  final String _token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNGNhYmM1ODJiNGNmZmE0YjAyYWUyYjk4YzZiZTMxNyIsInN1YiI6IjY2MDFkZGU0MzUyMGU4MDE3ZWQ5ZmNjZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9TIkEzrUG_KGJp2lyesga2t0fo6PUHG9hzp_gmh7H2M';
  
  // final String _apiKey = 'd4cabc582b4cffa4b02ae2b98c6be317';
  
  final String _baseUrl = 'api.themoviedb.org';

  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];

  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;

  MoviesProvider() {

    getOnDisplayMovies();

    getPopularMovies();

  }

  Future<String> _getJsonData(String path, [String page = '1']) async {

    var url = Uri.https( _baseUrl, path, {
      'language': _language,
      'page': page
    });

    final httpsResponse = await http.get(url, headers: {HttpHeaders.authorizationHeader: "Bearer $_token"});

    return httpsResponse.body;

  }

  getOnDisplayMovies() async {

    final jsonData = await _getJsonData('3/movie/now_playing');

    final response = NowPlayingResponse.fromRawJson(jsonData);

    onDisplayMovies = response.results;

    notifyListeners();

  }

  getPopularMovies() async {

    _popularPage++;
    
    final jsonData = await _getJsonData('3/movie/now_playing', _popularPage.toString());

    final response = PopularResponse.fromRawJson(jsonData);

    popularMovies = [...popularMovies, ...response.results];

    notifyListeners();

  }

  Future<List<Cast>> getMoviesCast( int movieid ) async {
    
    final jsonData = await _getJsonData('3/movie/$movieid/credits', _popularPage.toString());

    final response = CreditsResponse.fromRawJson(jsonData);

    moviesCast[movieid] = response.cast;

    return response.cast;

  }

}