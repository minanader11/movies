import 'package:flutter/material.dart';
import 'package:movies/core/custom_text_field.dart';
import 'package:movies/features/search/view/manager/search_provider.dart';
import 'package:movies/features/search/view/presentation/widgets/search_list.dart';
import 'package:provider/provider.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    var searchProvider = Provider.of<SearchProvider>(context);
    return Container(padding: EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextField(
            label: 'search',
            controller: textController,
          ),
          searchProvider.isSearching==false
              ? Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Icon material-local-movies.png',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'No Movies Found',
                      ),
                    ],
                  ),
                )
              : Expanded(child: SearchList())
        ],
      ),
    );
  }
}
