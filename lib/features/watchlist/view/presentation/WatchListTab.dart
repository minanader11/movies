import 'package:flutter/material.dart';
import 'package:movies/features/watchlist/view/manager/watchlist_provider.dart';
import 'package:movies/features/watchlist/view/presentation/watchlist_movies_list.dart';
import 'package:provider/provider.dart';

class WatchlistTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var watchListProvider=Provider.of<WatchlistProvider>(context);
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'WatchList',
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25),
            ),
            watchListProvider.movies.isEmpty? Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.4),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Icon material-local-movies.png',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'No Movies Found',
                  ),
                ],
              ),
            ): Expanded(child: WatchlistMoviesList(movies: watchListProvider.movies,))
          ],
        ));
  }
}
