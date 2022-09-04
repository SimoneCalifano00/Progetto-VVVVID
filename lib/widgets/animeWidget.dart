import 'package:flutter/foundation.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/genere.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/screens/generi_screen.dart';
import 'carousel.dart';
import '../models/dummy_products.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../screens/user_screen.dart';
import '../models/user.dart';

class AnimeContainer extends StatefulWidget {
  const AnimeContainer(this.currUser);
  final User currUser;

  @override
  State<AnimeContainer> createState() => _AnimeContainerState();
}

class _AnimeContainerState extends State<AnimeContainer> {
  String _dropdownValue = "";

  void _dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
      pushNewScreen(context,
          screen: GeneriScreen(selectedValue, widget.currUser, Sezione.Anime));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Products> productList =
        DUMMY_PRODUCTS.where((product) => product.isAnime == true).toList();

    List<Generi>? generiOrdinati = widget.currUser.generi;

    generiOrdinati!.sort((a, b) {
      return a.rating.compareTo(b.rating);
    });

    print(generiOrdinati.map((genere) => genere.rating));

    /*List<Generi>? generiPreferiti = generiOrdinati
        .getRange(generiOrdinati.length - 3, generiOrdinati.length)
        .toList();

    print(generiPreferiti.map((genere) => genere.rating));
    */

    //passare generi ordinati reversed
    List<Generi> getGeneriPreferitiNonVuoti(
        List<Products> allProducts, List<Generi> preferences) {
      List<Generi> generiPreferiti = [];

      for (int i = 0; i <= preferences.length - 1; i++) {
        allProducts.forEach((element) {
          if (element.generi.contains(preferences[i].nome) &&
              !generiPreferiti.contains(preferences[i])) {
            print(preferences[i].nome);
            generiPreferiti.add(preferences[i]);
          }
        });
      }

      return generiPreferiti;
    }

    Generi genere1;
    Generi genere2;
    Generi genere3;

    Generi getGenere(
      int i,
    ) {
      Generi genere = Generi(nome: '', rating: -1);
      if (getGeneriPreferitiNonVuoti(
              productList, generiOrdinati.reversed.toList())
          .asMap()
          .containsKey(i)) {
        genere = getGeneriPreferitiNonVuoti(
                productList, generiOrdinati.reversed.toList())
            .elementAt(i);
      }
      return genere;
    }

    genere1 = getGenere(0);

    print('GENERE 1' + genere1.nome);

    genere2 = getGenere(1);

    genere3 = getGenere(2);
    print('GENERE 3' + genere3.nome);

    List<Products> list1 = [];
    if (genere1.nome.isNotEmpty &&
        genere1.nome != genere2.nome &&
        genere1.nome != genere3.nome) {
      list1 = productList
          .where((product) => product.generi.contains(genere1.nome))
          .toList();
    }

    List<Products> list2 = [];
    if (genere2.nome.isNotEmpty &&
        genere2.nome != genere1.nome &&
        genere2.nome != genere3.nome) {
      list2 = productList
          .where((product) => product.generi.contains(genere2.nome))
          .toList();
    }

    if (listEquals(list2, list1) == true) {
      list2 = [];
    }

    List<Products> list3 = [];
    if (genere3.nome.isNotEmpty &&
        genere3.nome != genere1.nome &&
        genere3.nome != genere1.nome) {
      list3 = productList
          .where((product) => product.generi.contains(genere3.nome))
          .toList();
    }

    if (listEquals(list3, list2) == true || listEquals(list3, list1)) {
      list3 = [];
    }

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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                            child: Text('Seinen'),
                            value: 'Seinen',
                          ),
                          DropdownMenuItem(
                            child: Text('Shonen'),
                            value: 'Shonen',
                          ),
                          DropdownMenuItem(
                            child: Text('Comico'),
                            value: 'Comico',
                          ),
                          DropdownMenuItem(
                            child: Text('Drammatico'),
                            value: 'Drammatico',
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
                children: [
                  list1.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
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
