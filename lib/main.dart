import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/api_service.dart';
import 'package:movies/core/model/movie.dart';
import 'package:movies/core/myTheme.dart';

import 'package:movies/features/home/view/presentation/movie_details.dart';
import 'package:movies/features/main_page.dart';
import 'package:movies/features/search/view/manager/search_provider.dart';
import 'package:movies/features/splash_Screen/splash_Screen.dart';
import 'package:movies/features/watchlist/view/manager/watchlist_provider.dart';
import 'package:movies/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => SearchProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => WatchlistProvider()..getMovies(),
    ),

  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.theme,
      routes: {
        MainPage.routeName: (context) => MainPage(),
        SplashScreen.routeName:(context) => SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
