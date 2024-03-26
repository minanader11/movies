import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movies/core/model/movie.dart';
import 'package:movies/core/myTheme.dart';
import 'package:movies/features/search/view/presentation/widgets/searched_movie_item.dart';
import 'package:movies/features/watchlist/view/manager/watchlist_provider.dart';
import 'package:provider/provider.dart';

class WatchlistMoviesList extends StatelessWidget {
   WatchlistMoviesList({required this.movies});
   List<Result> movies;
  @override
  Widget build(BuildContext context) {
    var watchListProvider = Provider.of<WatchlistProvider>(context);
    return Container(
      child: ListView.separated(separatorBuilder: (context, index) => Divider(color: MyTheme.grayColor,),scrollDirection: Axis.vertical,itemCount: movies!.length,itemBuilder: (context, index) {

        return //Text(movies[index].title??"");
          Container(
            child: Slidable(
              // Specify a key if the Slidable is dismissible.
              key: const ValueKey(0),
            
              // The start action pane is the one at the left or the top side.
              startActionPane: ActionPane(extentRatio: 0.25,
                // A motion is a widget used to control how the pane animates.
                motion: const ScrollMotion(),
            
                // A pane can dismiss the Slidable.
                dismissible: DismissiblePane(onDismissed: () {}),
            
                // All actions are defined in the children parameter.
                children:  [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(borderRadius: BorderRadius.circular(10),
                    onPressed: (context) {
                      watchListProvider.deleteMovie(movies[index]);
                    },
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
            
                ],
              ),
            
              // The end action pane is the one at the right or the bottom side.
            
            
              // The child of the Slidable is what the user sees when the
              // component is not dragged.
              child: SearchedMovieItem(movie: movies[index])),
          );

          //
      },
      ),
    );
  }
}
