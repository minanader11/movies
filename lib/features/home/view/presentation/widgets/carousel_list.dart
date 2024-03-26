import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/api_service.dart';
import 'package:movies/features/home/view/presentation/widgets/carousel_item.dart';

class CarouselList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<MovieCarouselItem> carousel = [];
    return FutureBuilder(
      future: ApiService.getPopularMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(height: height*0.4,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Column(children: [
            Text('Something went wrong'),
            ElevatedButton(
                onPressed: () {
                  ApiService.getPopularMovies();
                },
                child: Text('Try again'))
          ]);
        } else if (snapshot.data!.success == false) {
          return Column(children: [
            Text(snapshot.data?.statusMessage ?? ''),
            ElevatedButton(
                onPressed: () {
                  ApiService.getPopularMovies();
                },
                child: Text('Try again'))
          ]);
        }
        var movies = snapshot.data!.results;
        for (var movie in movies!) {
          carousel.add(MovieCarouselItem(movie: movie));
        }
        return CarouselSlider(
            items: carousel,
            options: CarouselOptions(viewportFraction: 1,autoPlay: true,
                height: MediaQuery.of(context).size.height * 0.4),
        );
      },
    );
  }
}
