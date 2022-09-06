import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/comment.dart';
import 'package:new_vvvvid/models/genere.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:flutter/material.dart';
import 'package:new_vvvvid/screens/video_player_screen.dart';
import 'package:new_vvvvid/widgets/character_carousel.dart';
import 'package:new_vvvvid/widgets/comment_list.dart';
import 'package:new_vvvvid/widgets/img_carousel.dart';
import 'package:new_vvvvid/widgets/new_comment.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class FilmProductContainer extends StatefulWidget {
  const FilmProductContainer(this.selectedProduct, this.currUser);

  final User currUser;
  final Products selectedProduct;

  @override
  State<FilmProductContainer> createState() => _FilmProductContainerState();
}

class _FilmProductContainerState extends State<FilmProductContainer> {
  void _addComment(String comment) {
    final newComment = Comment(
        creatorId: widget.currUser.id,
        text: comment,
        date: DateTime.now(),
        replies: [],
        idLikes: [],
        likes: 0);
    setState(() {
      widget.selectedProduct.comments.add(newComment);
    });
  }

  void startNewComment(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewComment(_addComment, widget.currUser),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  bool isInUsersWatchLaterList() {
    if (widget.currUser.guardaPiuTardi.contains(widget.selectedProduct)) {
      return true;
    } else {
      return false;
    }
  }

  bool isInUsersFavouriteList() {
    if (widget.currUser.favouriteProducts!.contains(widget.selectedProduct)) {
      return true;
    } else {
      return false;
    }
  }

  void addWatchLater() {
    setState(() {
      widget.currUser.guardaPiuTardi.add(widget.selectedProduct);
    });
  }

  void removeWatchLater() {
    setState(() {
      widget.currUser.guardaPiuTardi.remove(widget.selectedProduct);
    });
  }

  void addFavorite() {
    setState(() {
      widget.currUser.favouriteProducts!.add(widget.selectedProduct);
    });
  }

  void removeFavorite() {
    setState(() {
      widget.currUser.favouriteProducts!.remove(widget.selectedProduct);
    });
  }

  void addGenere(User currUser, Products product) {
    List<String> generiProdotto = product.generi;

    for (Generi g in currUser.generi!) {
      print(g);
      if (generiProdotto.contains(g.nome)) {
        setState(() {
          g.rating = g.rating + 1;
        });

        print('G ADDIZIONATO ' + g.rating.toString());
      }
    }
  }

  void addContinuaGuardare() {
    setState(() {
      widget.currUser.continuaAGuardare.add(widget.selectedProduct);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;
    final _displayPaddingBottom = MediaQuery.of(context).padding.bottom;
    final _displayPaddingTop = MediaQuery.of(context).padding.top;

    return Container(
      margin: EdgeInsets.only(
          top: _displayHeight * 0.03,
          left: _displayWidth * 0.02,
          right: _displayWidth * 0.02),
      height: (_displayHeight - _displayPaddingBottom - _displayPaddingTop),
      width: _displayWidth,
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Text(
                    widget.selectedProduct.title,
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              !isInUsersWatchLaterList()
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: addWatchLater,
                            icon: Icon(Icons.watch_later_outlined),
                            color: const Color.fromARGB(255, 252, 56, 98))
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: removeWatchLater,
                            icon: Icon(Icons.watch_later),
                            color: const Color.fromARGB(255, 252, 56, 98))
                      ],
                    ),
              !isInUsersFavouriteList()
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: addFavorite,
                            icon: Icon(Icons.favorite_border_outlined),
                            color: const Color.fromARGB(255, 252, 56, 98))
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: removeFavorite,
                            icon: Icon(Icons.favorite),
                            color: const Color.fromARGB(255, 252, 56, 98))
                      ],
                    ),
            ],
          ),
          SizedBox(
            height: _displayHeight * 0.009,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: _displayWidth * 0.009,
              ),
              Icon(
                Icons.hourglass_bottom,
                color: const Color.fromARGB(255, 252, 56, 98),
              ),
              Text(widget.selectedProduct.minutaggio.toString() + " Min."),
              SizedBox(
                width: _displayWidth * 0.09,
              ),
              Icon(
                Icons.calendar_month,
                color: const Color.fromARGB(255, 252, 56, 98),
              ),
              Text(widget.selectedProduct.date.year.toString()),
            ],
          ),
          SizedBox(
            height: _displayHeight * 0.013,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Colors.black,
                      const Color.fromARGB(255, 252, 56, 98),
                    ])),
                height: _displayHeight * 0.085,
                width: _displayWidth * 0.8,
                child: InkWell(
                  onTap: () {
                    addGenere(widget.currUser, widget.selectedProduct);
                    addContinuaGuardare();
                    pushNewScreen(context,
                        withNavBar: false,
                        screen: VideoPlayerScreen(widget.currUser,
                            widget.selectedProduct.title, '', 1));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: _displayWidth * 0.01),
                        child: Text(
                          'GUARDA ORA',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: _displayWidth * 0.01),
                        child: Icon(
                          Icons.play_arrow,
                          size: 40,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: _displayHeight * 0.009,
          ),

          SizedBox(
            width: _displayWidth,
            height: _displayHeight * 0.335,
            child: ImgCarousel(widget.selectedProduct.previewImgsUrls),
          ),

          SizedBox(
            height: _displayHeight * 0.02,
          ),

          Column(
            children: [
              Text(
                'Personaggi',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: _displayHeight * 0.02,
              ),
              SizedBox(
                width: _displayWidth,
                height: _displayHeight * 0.335,
                child: CharacterCarousel(
                    widget.selectedProduct.characters, widget.currUser),
              ),
            ],
          ),

          SizedBox(
            height: _displayHeight * 0.009,
          ),
          Column(children: [
            Text('Trama',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4),
            SizedBox(
              height: _displayHeight * 0.02,
            ),
            Text(
              widget.selectedProduct.description,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText2,
              softWrap: true,
            ),
          ]),
          //Comments

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: _displayHeight * 0.13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      widget.currUser.localPic == ""
                          ? CircleAvatar(
                              foregroundImage:
                                  NetworkImage(widget.currUser.profilePicUrl),
                              backgroundColor: Colors.grey,
                              radius: _displayWidth * 0.08)
                          : CircleAvatar(
                              foregroundImage:
                                  FileImage(File(widget.currUser.localPic)),
                              backgroundColor: Colors.grey,
                              radius: _displayWidth * 0.08),
                      SizedBox(
                        width: _displayWidth * 0.04,
                      ),
                      GestureDetector(
                          onTap: () => startNewComment(context),
                          child: Text(
                            'Aggiungi nuovo commento...',
                            style: Theme.of(context).textTheme.headline4,
                          )),
                      SizedBox(
                        width: _displayWidth * 0.04,
                      ),
                      IconButton(
                          onPressed: () => startNewComment(context),
                          icon: Icon(Icons.arrow_forward_ios_outlined,
                              color: Colors.white),
                          iconSize: 20)
                    ],
                  )),
              SizedBox(
                width: _displayWidth * 0.85,
                height: _displayHeight * 0.7,
                child: CommentList(
                    widget.selectedProduct.comments, widget.currUser),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
