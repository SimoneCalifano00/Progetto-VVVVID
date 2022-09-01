import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/models/user.dart';

class FilmProductContainer extends StatelessWidget {
  const FilmProductContainer(this.film, this.currUser);

  final User currUser;
  final Products film;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(film.title),
    );
  }
}
