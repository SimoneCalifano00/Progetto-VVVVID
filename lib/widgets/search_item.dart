import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/user.dart';
import '../screens/episodic_product_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../screens/film_product_screen.dart';

class SearchItem extends StatelessWidget {
  SearchItem(this.searchedProduct, this.query, this.suggestion, this.currUser);

  final Products searchedProduct;
  String query;
  final Products suggestion;
  final User currUser;

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        query = suggestion.title;
        if (suggestion.isEpisodic) {
          pushNewScreen(context,
              screen: EpisodicProductScreen(currUser, suggestion));
        } else {
          pushNewScreen(context,
              screen: FilmProductScreen(suggestion, currUser));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _displayWidth * 0.003),
        child: Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(searchedProduct.previewImgUrl),
                        fit: BoxFit.scaleDown)),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: EdgeInsets.only(
                    right: _displayWidth * 0.02, top: _displayHeight * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: _displayWidth * 0.02),
                      child: Text(
                        searchedProduct.title,
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: _displayHeight * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: _displayWidth * 0.02),
                      child: Text(
                        'Anno Uscita: ' + searchedProduct.date.year.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: _displayHeight * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: _displayWidth * 0.02),
                      child: Text(
                        'Generi: ' +
                            searchedProduct.generi.toString().substring(1,
                                searchedProduct.generi.toString().length - 1),
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: _displayHeight * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: _displayWidth * 0.02),
                      child: Text(
                        searchedProduct.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 6,
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

/*
ListTile(
      
        horizontalTitleGap: 14,
        minLeadingWidth: 1,
        leading: FittedBox(
          fit: BoxFit.fitHeight,
          child: Image.network(
            searchedProduct.previewImgUrl,
          ),
        ),
        title: Text(
          searchedProduct.title,
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
*/
