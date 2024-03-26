import 'package:flutter/material.dart';
import 'package:movies/core/myTheme.dart';
import 'package:movies/features/Browse/browse_tab.dart';
import 'package:movies/features/home/view/presentation/home_tab.dart';
import 'package:movies/features/search/view/manager/search_provider.dart';
import 'package:movies/features/search/view/presentation/SearchTab.dart';
import 'package:movies/features/watchlist/view/manager/watchlist_provider.dart';

import 'package:movies/features/watchlist/view/presentation/WatchListTab.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  static const String routeName = 'MainPage';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context);
    List<Widget> tabs = [HomeTab(), SearchTab(), BrowseTab(), WatchlistTab()];
    //var watchListProvider=Provider.of<WatchlistProvider>(context);
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: MyTheme.bottomBarColor),
        child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex = value;
              searchProvider.changeSearchingState(false);
              searchProvider.changeMovie('');
             // watchListProvider.getMovies();
            //  print(watchListProvider.watchlistMovies.length);
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'SEARCH'),
              BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'BROWSE'),
              BottomNavigationBarItem(
                  icon:
                      Image.asset('assets/images/Icon ionic-md-bookmarks.png'),
                  label: 'WATCHLIST'),
            ]),
      ),
      body: tabs[selectedIndex],
    );
  }
}
