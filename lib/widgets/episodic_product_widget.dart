import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/comment.dart';
import 'package:new_vvvvid/models/dummy_products.dart';
import 'package:new_vvvvid/models/products.dart';
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
  EpisodicProductContainer(this.selectedProduct);

  @override
  State<EpisodicProductContainer> createState() =>
      _EpisodicProductContainerState();
}

class _EpisodicProductContainerState extends State<EpisodicProductContainer> {
  void _addComment(String comment) {
    final newComment = Comment(creatorId: 1, text: comment);
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
            child: NewComment(_addComment),
            behavior: HitTestBehavior.opaque,
          );
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
          SizedBox(
            width: _displayWidth * 1,
            height: _displayHeight * 0.05,
            child: Text(
              widget.selectedProduct.title,
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
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
                  Text('DATA USCITA:'),
                  SizedBox(
                    width: _displayWidth * 0.02,
                  ),
                  Text(widget.selectedProduct.date.day.toString() +
                      '/' +
                      widget.selectedProduct.date.month.toString() +
                      '/' +
                      widget.selectedProduct.date.year.toString()),
                ],
              ),
              SizedBox(
                height: _displayHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('GENERI:'),
                  SizedBox(
                    width: _displayWidth * 0.02,
                  ),
                  Text(widget.selectedProduct.generi.toString()),
                ],
              ),
            ],
          ),
          //Season Carousel
          SizedBox(
            height: _displayHeight * 0.015,
          ),
          SeasonCarousel(widget.selectedProduct.seasons),

          //Comments
          SizedBox(
            height: _displayHeight * 0.02,
          ),

          SizedBox(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                  foregroundImage: NetworkImage(
                      'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/profile-pic1.jpg'),
                  backgroundColor: Colors.grey,
                  radius: _displayWidth * 0.08), //AGGIUNGERE SESSIONE UTENTE
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
          /* ElevatedButton(
              onPressed: () => startNewComment(context),
              child: Text('Aggiungi nuovo commento...')),*/

          SizedBox(
            height: _displayHeight * 0.015,
          ),

          CommentList(widget.selectedProduct.comments),
        ]),
      ),
    );
  }
}
