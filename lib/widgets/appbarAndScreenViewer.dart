import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/main.dart';
import 'package:new_vvvvid/models/dummy_products.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/screens/episodic_product_screen.dart';
import 'package:new_vvvvid/screens/film_product_screen.dart';
import 'package:new_vvvvid/screens/homepage.dart';
import 'package:new_vvvvid/widgets/search_item.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../screens/user_screen.dart';
import '../models/user.dart';

class AppbarAndScreen extends StatelessWidget {
  AppbarAndScreen(this.screen, this.currUser);

  final Widget screen;
  final User currUser;

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;
    final _displayPaddingBottom = MediaQuery.of(context).padding.bottom;
    final _displayPaddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
        body: NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          centerTitle: true,
          floating: true,
          title: Container(
              width: _displayWidth * 0.2,
              height: _displayHeight * 0.19,
              child: GestureDetector(
                  onTap: () =>
                      pushNewScreen(context, screen: HomePageScreen(currUser)),
                  child: Image.asset('lib/assets/imgs/LogoVVVVID.jpg')),
              alignment: Alignment.center),
          leading: Padding(
            padding: EdgeInsets.all(_displayWidth * 0.01),
            child: InkWell(
                onTap: () =>
                    pushNewScreen(context, screen: UserScreen(currUser)),
                child: currUser.localPic == ""
                    ? CircleAvatar(
                        foregroundImage: NetworkImage(currUser.profilePicUrl),
                        backgroundColor: Colors.grey,
                        radius: _displayWidth * 0.2)
                    : CircleAvatar(
                        foregroundImage: FileImage(File(currUser.localPic)),
                        backgroundColor: Colors.grey,
                        radius: _displayWidth * 0.2)),
          ),
          leadingWidth: _displayWidth * 0.2,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _displayWidth * 0.034),
              child: IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: MySearchDelegate(currUser));
                },
                icon: Icon(
                  Icons.search_outlined,
                ),
                iconSize: _displayWidth * 0.085,
              ),
            )
          ],
        ),
      ],
      body: screen,
    ));
  }
}

class MySearchDelegate extends SearchDelegate {
  MySearchDelegate(this.currUser);
  final User currUser;
  List<Products> searchResults = DUMMY_PRODUCTS;

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);

    final ThemeData theme = Theme.of(context).copyWith(
      scaffoldBackgroundColor: Colors.black87,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.black,
      ),
      primaryColor: Colors.black87,
      hintColor: Colors.black54,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );

    assert(theme != null);
    return theme;
  }

  @override
  Widget buildResults(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;

    List<Products> suggestions = searchResults.where((searchResult) {
      final result = searchResult.title.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: _displayHeight,
        width: _displayWidth,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Risultati per la ricerca "' + query + '"',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: _displayHeight * 0.03,
              ),
              suggestions.isNotEmpty
                  ? SizedBox(
                      height: _displayHeight * 0.9,
                      width: _displayWidth * 0.98,
                      child: ListView.builder(
                        itemExtent: _displayHeight * 0.34,
                        itemBuilder: (context, index) {
                          final suggestion = suggestions[index];

                          return SearchItem(
                              suggestion, query, suggestion, currUser);
                        },
                        itemCount: suggestions.length,
                      ),
                    )
                  : Text('Nessun riscontro, spiacente :C',
                      style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Products> suggestions = searchResults.where((searchResult) {
      final result = searchResult.title.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
            horizontalTitleGap: 14,
            minLeadingWidth: 1,
            leading: FittedBox(
              fit: BoxFit.fitHeight,
              child: Image.network(
                suggestion.previewImgUrl,
              ),
            ),
            title: Text(
              suggestion.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () {
              query = suggestion.title;
              if (suggestion.isEpisodic) {
                pushNewScreen(context,
                    screen: EpisodicProductScreen(currUser, suggestion));
              } else {
                pushNewScreen(context,
                    screen: FilmProductScreen(suggestion, currUser));
              }
            });
      },
      itemCount: suggestions.length,
    );
  }
}
