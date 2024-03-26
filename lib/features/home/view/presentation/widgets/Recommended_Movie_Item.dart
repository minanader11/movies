import 'package:flutter/material.dart';
import 'package:movies/core/model/movie.dart';
import 'package:movies/core/myTheme.dart';
import 'package:movies/features/home/view/presentation/widgets/movie_item.dart';
import 'package:movies/features/home/view/presentation/widgets/movie_title.dart';

class RecommendedMovieItem extends StatelessWidget {
   RecommendedMovieItem({required this.movie,required this.index});
 Result movie;
 int index;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: MyTheme.darkGray,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: MovieItem(index: index,movie: movie,)),
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star_purple500_outlined,
                            color: MyTheme.goldColor,
                            size: 15,
                          ),
                          SizedBox(width: 4,),
                          Text(
                            movie.voteAverage.toString()?? '',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Text(
                        movie.title??'',
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 1,
                      ),
                      Text(
                        movie.releaseDate??'',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: MyTheme.grayColor),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
