import 'package:flutter/material.dart';
import 'package:movies/core/model/movie.dart';

class SearchProvider extends ChangeNotifier{
  List<Movie> movies=[];
  String searchMovie='';
  bool isSearching=false;
 void changeMovies(List<Movie>newMovies ){
    movies = newMovies;
    notifyListeners();
  }
  void changeMovie(String movie){
   searchMovie=movie;
   notifyListeners();
  }
void changeSearchingState(bool searchingState){
   isSearching= searchingState;
   notifyListeners();
}
}