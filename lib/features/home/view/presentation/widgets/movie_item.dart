import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/api_constants.dart';
import 'package:movies/core/model/movie.dart';
import 'package:movies/core/myTheme.dart';

import 'package:movies/features/watchlist/view/manager/watchlist_provider.dart';
import 'package:provider/provider.dart';

class MovieItem extends StatefulWidget {
  MovieItem({required this.movie, required this.index});
  Result movie;
  int index;
  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var watchListProvider = Provider.of<WatchlistProvider>(context);
    String imagePath = widget.movie.backdropPath == null
        ? //'https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg?w=900'
   'https://gordontredgold.com/wp-content/uploads/2021/08/broken-1.png'
        : ApiConstants.imagePath + widget.movie.backdropPath!;
    return Container(
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            height: double.infinity,
            imageUrl: imagePath,
            placeholder: (context, url) =>
                Center(child: const CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        watchListProvider.movies.contains(widget.movie)
            ? Image.asset('assets/images/bookmark.png')
            : Image.asset('assets/images/Icon awesome-bookmark.png'),
        InkWell(
            onTap: () {
              watchListProvider.addMovie(widget.movie);
            },
            child: watchListProvider.movies.contains(widget.movie)
                ? Icon(
                    Icons.check,
                    color: MyTheme.whiteColor,
                    size: 25,
                  )
                : Icon(
                    Icons.add,
                    color: MyTheme.whiteColor,
                    size: 25,
                  )),
      ]),
    );
  }
}

//fit: BoxFit.fill,height: double.infinity,
