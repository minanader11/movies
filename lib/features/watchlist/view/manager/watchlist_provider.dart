import 'package:flutter/cupertino.dart';
import 'package:movies/core/firebaseUtils.dart';
import 'package:movies/core/model/movie.dart';

class WatchlistProvider extends ChangeNotifier{
  List<Result> movies=[];
  void getMovies()async{
    var querysnapshot= await FirebaseUtils.getMoviesCollection().get();
    movies =querysnapshot.docs.map((e) => e.data()).toList();
    notifyListeners();
  }
  void addMovie(Result movie){
    FirebaseUtils.addMovie(movie);
    movies.add(movie);
    notifyListeners();
  }
  void deleteMovie(Result movie){
    FirebaseUtils.getMoviesCollection().doc(movie.id.toString()).delete();
    movies.remove(movie);
    notifyListeners();
  }
}