import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_vvvvid/main.dart';
import 'package:new_vvvvid/models/comment.dart';
import 'package:new_vvvvid/models/dummy_products.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/models/reply.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/screens/homepage.dart';
import 'package:new_vvvvid/widgets/comment_list.dart';
import 'package:new_vvvvid/widgets/img_carousel.dart';
import 'package:new_vvvvid/widgets/new_comment.dart';
import 'package:new_vvvvid/widgets/season_carousel.dart';
import 'carousel.dart';
import 'package:flutter/services.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../screens/user_screen.dart';

class EpisodicProductContainer extends StatefulWidget {
  final Products selectedProduct;
  final User currUser;
  EpisodicProductContainer(this.selectedProduct, this.currUser);

  @override
  State<EpisodicProductContainer> createState() =>
      _EpisodicProductContainerState();
}

class _EpisodicProductContainerState extends State<EpisodicProductContainer> {
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
            height: _displayHeight * 0.02,
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
              Text('Informazioni',
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
              SizedBox(
                height: _displayHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'DATA USCITA:',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(
                    width: _displayWidth * 0.02,
                  ),
                  Text(
                    widget.selectedProduct.date.day.toString() +
                        '/' +
                        widget.selectedProduct.date.month.toString() +
                        '/' +
                        widget.selectedProduct.date.year.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              SizedBox(
                height: _displayHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'GENERI:',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(
                    width: _displayWidth * 0.02,
                  ),
                  Text(widget.selectedProduct.generi.toString().substring(
                      1, widget.selectedProduct.generi.toString().length - 1)),
                ],
              ),
            ],
          ),
          //Season Carousel
          SizedBox(
            height: _displayHeight * 0.015,
          ),
          SeasonCarousel(widget.selectedProduct.seasons, widget.currUser),

          //Comments
          SizedBox(
            height: _displayHeight * 0.02,
          ),

          SizedBox(
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
            height: _displayHeight * 0.015,
          ),

          CommentList(widget.selectedProduct.comments, widget.currUser),
        ]),
      ),
    );
  }
}
