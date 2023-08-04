import 'dart:convert';

import 'package:http/http.dart' as http;
import '../constants.dart';
import '../models/movie.dart';

class Api{
  static const _tredingUrl = 'https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}';
  static const _topratedUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _upcomingUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';


  Future<List<Movie>> getTradingMovies() async{
    final Response = await http.get(Uri.parse(_tredingUrl));
    if(Response.statusCode == 200){
      final decodedData = json.decode(Response.body)['results'] as List;
      return decodedData.map((movie) => Movie.formJson(movie)).toList();
    }else{
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getTopratedMovies() async{
    final Response = await http.get(Uri.parse(_topratedUrl));
    if(Response.statusCode == 200){
      final decodedData = json.decode(Response.body)['results'] as List;
      return decodedData.map((movie) => Movie.formJson(movie)).toList();
    }else{
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async{
    final Response = await http.get(Uri.parse(_upcomingUrl ));
    if(Response.statusCode == 200){
      final decodedData = json.decode(Response.body)['results'] as List;
      return decodedData.map((movie) => Movie.formJson(movie)).toList();
    }else{
      throw Exception('Something happened');
    }
  }
}