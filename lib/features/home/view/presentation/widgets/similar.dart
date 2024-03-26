import 'package:flutter/material.dart';
import 'package:movies/core/api_service.dart';
import 'package:movies/core/model/movie.dart';
import 'package:movies/core/myTheme.dart';
import 'package:movies/features/home/view/presentation/movie_details.dart';
import 'package:movies/features/home/view/presentation/widgets/Recommended_Movie_Item.dart';

class SimilarMovie extends StatelessWidget {
  SimilarMovie({required this.movie});

  Result movie;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: ApiService.getSimilarMovies(movie.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: height*0.2,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Column(children: [
            Text('Something went wrong'),
            ElevatedButton(
                onPressed: () {
                  ApiService.getSimilarMovies(movie.id!);
                },
                child: Text('Try again'))
          ]);
        } else if (snapshot.data!.success == false) {
          return Column(children: [
            Text(snapshot.data?.statusMessage ?? ''),
            ElevatedButton(
                onPressed: () {
                  ApiService.getSimilarMovies(movie.id!);
                },
                child: Text('Try again'))
          ]);
        }
        var movies = snapshot.data!.results;
        return Container(
          color: MyTheme.darkGray,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      MovieDetails(movie: snapshot.data!.results![index]),
                )),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: RecommendedMovieItem(
                    movie: snapshot.data!.results![index],
                    index: index,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
