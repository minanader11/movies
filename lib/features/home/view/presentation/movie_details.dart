import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/api_constants.dart';
import 'package:movies/core/model/movie.dart';
import 'package:movies/core/myTheme.dart';
import 'package:movies/features/home/view/presentation/widgets/movie_item.dart';
import 'package:movies/features/home/view/presentation/widgets/similar.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails({required this.movie});

  Result movie;
  static const String routeName = 'MovieDetails';

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String imagePath = widget.movie.backdropPath == null
        ? 'https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg?w=900'
        : ApiConstants.imagePath + widget.movie.backdropPath!;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title ?? ''),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height-MediaQuery.of(context).padding.top,
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Image.network(imagePath),
              CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: imagePath,
                placeholder: (context, url) =>
                    Center(child: const CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(
                height: 11,
              ),
              Text(
                widget.movie.title ?? '',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                widget.movie.releaseDate ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: MyTheme.grayColor),
              ),
              const SizedBox(
                height: 19,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //MovieItem(movie: widget.movie, index: 0),
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: height * 0.2,
                    width: width * 0.35,
                    imageUrl: imagePath,
                    placeholder: (context, url) =>
                        Center(child: const CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                 // Image.network(
                   // ApiConstants.imagePath + widget.movie.backdropPath!,
                   // height: height * 0.2,
                   // width: width * 0.35,
                   // fit: BoxFit.fill,
                 // ),
                  //Image.asset(
                  //    'assets/images/movie.jpeg'),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          widget.movie.overview ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 12, color: MyTheme.grayColor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                           const  Icon(
                              Icons.star_purple500_outlined,
                              color: MyTheme.goldColor,
                              size: 30,
                            ),
                           const  SizedBox(
                              width: 4,
                            ),
                            Text(
                              widget.movie.voteAverage.toString() ?? '',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
             const  SizedBox(
                height: 20,
              ),
              Text(
                'More Like This',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Expanded(
                  child: SimilarMovie(
                movie: widget.movie,
              )),
             const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
