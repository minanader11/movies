import 'package:flutter/material.dart';
import 'package:movies/features/home/view/presentation/widgets/New_releases_List.dart';
import 'package:movies/features/home/view/presentation/widgets/Recommended_List.dart';
import 'package:movies/features/home/view/presentation/widgets/carousel_item.dart';
import 'package:movies/features/home/view/presentation/widgets/carousel_list.dart';
import 'package:movies/features/home/view/presentation/widgets/movie_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //CarouselList(),
        CarouselList(),

        SizedBox(height: 10,),
        Text('New Releases',style: Theme.of(context).textTheme.bodyLarge,),
        Expanded(child: NewReleasesList()),
        SizedBox(height: 10,),
        Text('Recommended',style: Theme.of(context).textTheme.bodyLarge,),
        Expanded(child: RecommendedList()),

      ],
    );
  }
}
