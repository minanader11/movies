import 'package:flutter/material.dart';
import 'package:movies/core/api_service.dart';
import 'package:movies/core/myTheme.dart';
import 'package:movies/features/search/view/manager/search_provider.dart';
import 'package:movies/features/search/view/presentation/widgets/searched_movie_item.dart';
import 'package:provider/provider.dart';

class SearchList extends StatefulWidget {


  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context);
    return  searchProvider.isSearching == false?Container():
    FutureBuilder(future: ApiService.getSearchMovies(searchProvider.searchMovie), builder: (context, snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      } else if (snapshot.hasError){
        return  Column(children: [
          Text('Something went wrong'),
          ElevatedButton(
              onPressed: () {
                ApiService.getSearchMovies(searchProvider.searchMovie);
              },
              child: Text('Try again'))
        ]);

      } else if (snapshot.data!.success==false){
        return Column(children: [
          Text(snapshot.data?.statusMessage ?? ''),
          ElevatedButton(
              onPressed: () {
                ApiService.getSearchMovies(searchProvider.searchMovie);
              },
              child: Text('Try again'))
        ]);
      }  var movies = snapshot.data!.results;
      return Container(
        child: ListView.separated(separatorBuilder: (context, index) => Divider(color: MyTheme.grayColor,),scrollDirection: Axis.vertical,itemCount: movies!.length,itemBuilder: (context, index) {

          return //Text(movies[index].title??"");
             SearchedMovieItem(movie: movies[index]);
        },
        ),
      );

    },);
  }
}
