import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/api_constants.dart';
import 'package:movies/core/model/movie.dart';
import 'package:movies/features/home/view/presentation/movie_details.dart';
import 'package:movies/features/home/view/presentation/widgets/movie_item.dart';
import 'package:movies/features/home/view/presentation/widgets/movie_title.dart';

class MovieCarouselItem extends StatelessWidget {
   MovieCarouselItem({required this.movie});
  Result movie;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetails(movie: movie),)),
      child: Container(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: width,
                height: height*0.3,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: double.infinity,
                  imageUrl: ApiConstants.imagePath + movie.backdropPath!,
                  placeholder: (context, url) =>
                      Center(child: const CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: height * 0.2, left: width * 0.03,right: width*0.65),
                child:MovieItem(movie: movie,index: 0,)),
                /*CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: double.infinity,
                  imageUrl: ApiConstants.imagePath + movie.backdropPath!,
                  placeholder: (context, url) =>
                      Center(child: const CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),*/
              Container(
                padding: EdgeInsets.only(top: height * 0.32, left: width * 0.4),
                child: MovieTitle(movie: movie),
              )
            ],
          )),
    );
  }
}
