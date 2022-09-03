import 'dart:ffi';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ImgCarousel extends StatelessWidget {
  final List<String>? list;
  const ImgCarousel(this.list);

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: FittedBox(
              child: Padding(
                padding: EdgeInsets.all((_displayWidth * 0.05)),
                child: Container(
                  child: Image.network(list![index]),
                ),
              ),
            ),
          );
        },
        itemCount: list!.length,
      ),
    );
  }
}
