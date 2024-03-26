import 'package:flutter/material.dart';
import 'package:movies/core/model/movie.dart';
import 'package:movies/core/myTheme.dart';

class MovieTitle extends StatelessWidget {
   MovieTitle({required this.movie});
Result movie;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          movie.title??'',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          movie.releaseDate??'',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: MyTheme.grayColor),
        )
      ],
    );
  }
}
