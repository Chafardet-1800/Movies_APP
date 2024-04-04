import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider  extends ChangeNotifier{
  
  final String _token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNGNhYmM1ODJiNGNmZmE0YjAyYWUyYjk4YzZiZTMxNyIsInN1YiI6IjY2MDFkZGU0MzUyMGU4MDE3ZWQ5ZmNjZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9TIkEzrUG_KGJp2lyesga2t0fo6PUHG9hzp_gmh7H2M';
  
  final String _apiKey = 'd4cabc582b4cffa4b02ae2b98c6be317';
  
  final String _baseUrl = 'api.themoviedb.org';

  final String _language = 'es-ES';

  final String _page = '1';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    
    print('MoviesProvider inicializado');

    getOnDisplayMovies();

  }

  getOnDisplayMovies() async {

    var url = Uri.https( _baseUrl, '3/movie/now_playing', {
      'language': _language,
      'page': _page
    });

    final httpsResponse = await http.get(url, headers: {HttpHeaders.authorizationHeader: "Bearer $_token"});

    final response = NowPlayingResponse.fromRawJson(httpsResponse.body);

    onDisplayMovies = response.results;

    notifyListeners();

  }

}