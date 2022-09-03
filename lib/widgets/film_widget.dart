import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/genere.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/screens/generi_screen.dart';
import 'carousel.dart';
import '../models/dummy_products.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../screens/user_screen.dart';

class FilmContainer extends StatefulWidget {
  const FilmContainer(this.currUser);
  final User currUser;

  @override
  State<FilmContainer> createState() => _FilmContainerState();
}

class _FilmContainerState extends State<FilmContainer> {
  @override
  Widget build(BuildContext context) {
    String _dropdownValue;

    void _dropdownCallback(String? selectedValue) {
      if (selectedValue is String) {
        setState(() {
          _dropdownValue = selectedValue;
        });
        pushNewScreen(context,
            screen: GeneriScreen(selectedValue, widget.currUser, Sezione.Film));
      }
    }

    final List<Products> productList =
        DUMMY_PRODUCTS.where((product) => product.isFilm == true).toList();

    final List<Generi>? generiOrdinati = widget.currUser.generi;

    generiOrdinati!.sort((a, b) {
      return a.rating.compareTo(b.rating);
    });

    print(generiOrdinati.map((genere) => genere.rating));

    final generiPreferiti = generiOrdinati
        .getRange(generiOrdinati.length - 3, generiOrdinati.length)
        .toList();

    print(generiPreferiti.map((genere) => genere.rating));

    final Generi genere1 = generiPreferiti.last;
    print(genere1.nome);

    final Generi genere2 = generiPreferiti.elementAt(1);
    print(genere2.nome);

    final Generi genere3 = generiPreferiti.first;
    print(genere3.nome);

    final list1 = productList
        .where((product) => product.generi.contains(genere1.nome))
        .toList();

    final list2 = productList
        .where((product) => product.generi.contains(genere2.nome))
        .toList();

    final list3 = productList
        .where((product) => product.generi.contains(genere3.nome))
        .toList();

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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: _displayHeight * 0.005,
          ),
          Padding(
            padding: EdgeInsets.only(left: _displayWidth * 0.002),
            child: SizedBox(
              height: _displayHeight * 0.07,
              child: Card(
                color: const Color.fromARGB(255, 252, 56, 98),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: [
                      DropdownMenuItem(
                        child: Text('Avventura'),
                        value: 'Avventura',
                      ),
                      DropdownMenuItem(
                        child: Text('Comico'),
                        value: 'Comico',
                      ),
                      DropdownMenuItem(
                        child: Text('Azione'),
                        value: 'Azione',
                      ),
                      DropdownMenuItem(
                        child: Text('Fantascienza'),
                        value: 'Fantascienza',
                      ),
                      DropdownMenuItem(
                        child: Text('Fantasy'),
                        value: 'Fantasy',
                      ),
                      DropdownMenuItem(
                        child: Text('Horror'),
                        value: 'Horror',
                      ),
                      DropdownMenuItem(
                        child: Text('Thriller'),
                        value: 'Thriller',
                      ),
                      DropdownMenuItem(
                        child: Text('Supereroistico'),
                        value: 'Supereroistico',
                      )
                    ],
                    onChanged: _dropdownCallback,
                    hint: Padding(
                      padding: EdgeInsets.only(left: _displayWidth * 0.009),
                      child: Text(
                        'Generi',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    icon: Icon(Icons.keyboard_double_arrow_down,
                        color: Colors.white),
                    iconSize: 30,
                    style: Theme.of(context).textTheme.labelMedium,
                    menuMaxHeight: _displayHeight * 0.3,
                    focusColor: const Color.fromARGB(255, 252, 56, 98),
                    dropdownColor: const Color.fromARGB(255, 252, 56, 98),
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              list1.isNotEmpty
                  ? Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              genere1.nome,
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ),
                        Container(
                          width: _displayWidth,
                          height: _displayHeight * 0.335,
                          child: Carousel(list1, widget.currUser),
                        ),
                        SizedBox(
                          height: _displayHeight * 0.01,
                        ),
                      ],
                    )
                  : SizedBox(),
              list2.isNotEmpty
                  ? Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              genere2.nome,
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ),
                        Container(
                          width: _displayWidth,
                          height: _displayHeight * 0.335,
                          child: Carousel(list2, widget.currUser),
                        ),
                        SizedBox(
                          height: _displayHeight * 0.01,
                        ),
                      ],
                    )
                  : SizedBox(),
              list3.isNotEmpty
                  ? Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              genere3.nome,
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ),
                        Container(
                          width: _displayWidth,
                          height: _displayHeight * 0.335,
                          child: Carousel(list3, widget.currUser),
                        )
                      ],
                    )
                  : SizedBox(),
            ],
          )
        ])));
  }
}
