import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/core/model/movie.dart';

class FirebaseUtils{
  static CollectionReference<Result> getMoviesCollection(){
    final moviesRef = FirebaseFirestore.instance.collection('movies').withConverter<Result>(
      fromFirestore: (snapshot, _) => Result.fromJson(snapshot.data()!),
      toFirestore: (movie, _) => movie.toJson(),
    );
    return moviesRef;
  }
  static Future<void> addMovie(Result movie){
    var addedMovie = getMoviesCollection().doc(movie.id.toString()).set(movie);
    return addedMovie;
  }

}