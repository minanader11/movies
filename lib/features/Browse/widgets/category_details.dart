import 'package:flutter/material.dart';
import 'package:movies/core/api_service.dart';
import 'package:movies/core/model/MovieCategory.dart';
import 'package:movies/core/myTheme.dart';
import 'package:movies/features/search/view/presentation/widgets/searched_movie_item.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({super.key, required this.category, required this.index});

  MovieCategory category;
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.genres![index].name ?? '',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 24,
              ),
        ),
      ),
      body: FutureBuilder(
        future: ApiService.getMoviesByCategory(category.genres![index].id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Column(children: [
              Text('Something went wrong'),
              ElevatedButton(
                  onPressed: () {
                    ApiService.getMoviesByCategory(category.genres![index].id!);
                  },
                  child: Text('Try again'))
            ]);
          } else if (snapshot.data!.success == false) {
            return Column(children: [
              Text(snapshot.data?.statusMessage ?? ''),
              ElevatedButton(
                  onPressed: () {
                    ApiService.getMoviesByCategory(category.genres![index].id!);
                  },
                  child: Text('Try again'))
            ]);
          }
          var movies = snapshot.data!.results;
          return Container(
            child: ListView.separated(
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(color: MyTheme.grayColor, height: 1),
              ),
              scrollDirection: Axis.vertical,
              itemCount: movies!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchedMovieItem(movie: movies[index]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
