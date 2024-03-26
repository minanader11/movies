import 'package:flutter/material.dart';
import 'package:movies/core/api_service.dart';
import 'package:movies/core/myTheme.dart';
import 'package:movies/features/home/view/presentation/movie_details.dart';
import 'package:movies/features/home/view/presentation/widgets/movie_item.dart';

class NewReleasesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: ApiService.getReleasesMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(height: height*0.2,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Column(children: [
            Text('Something went wrong'),
            ElevatedButton(
                onPressed: () {
                  ApiService.getReleasesMovies();
                },
                child: Text('Try again'))
          ]);
        } else if (snapshot.data!.success == false) {
          return Column(children: [
            Text(snapshot.data?.statusMessage ?? ''),
            ElevatedButton(
                onPressed: () {
                  ApiService.getReleasesMovies();
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetails(movie: snapshot.data!.results![index]),)),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                  
                      child: MovieItem(
                          index: index, movie: snapshot.data!.results![index])),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
