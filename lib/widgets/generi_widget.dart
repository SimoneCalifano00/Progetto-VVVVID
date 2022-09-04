import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/dummy_products.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/screens/generi_screen.dart';
import 'package:new_vvvvid/widgets/product_item.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class GeneriContainer extends StatefulWidget {
  const GeneriContainer(this.genere, this.currUser, this.sezione);
  final String genere;
  final User currUser;
  final Sezione sezione;

  @override
  State<GeneriContainer> createState() => _GeneriContainerState();
}

class _GeneriContainerState extends State<GeneriContainer> {
  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;
    final _displayPaddingBottom = MediaQuery.of(context).padding.bottom;
    final _displayPaddingTop = MediaQuery.of(context).padding.top;

    String _dropdownValue;

    List<Products> list = DUMMY_PRODUCTS
        .where((product) =>
            product.generi.contains(widget.genere) &&
            product.sezione == widget.sezione)
        .toList();

    void _dropdownCallback(String? selectedValue) {
      if (selectedValue is String) {
        Navigator.of(context).pop();
        pushNewScreen(context,
            screen:
                GeneriScreen(selectedValue, widget.currUser, widget.sezione));
      }
    }

    return Container(
      margin: EdgeInsets.only(
          top: _displayHeight * 0.03,
          left: _displayWidth * 0.02,
          right: _displayWidth * 0.02),
      height: (_displayHeight - _displayPaddingBottom - _displayPaddingTop),
      width: _displayWidth,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: _displayWidth * 0.002),
              child: SizedBox(
                height: _displayHeight * 0.07,
                child: Card(
                  color: const Color.fromARGB(255, 252, 56, 98),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: widget.sezione.name == "Anime"
                          ? [
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
                            ]
                          : [
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
                          widget.genere,
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
            SizedBox(
              height: _displayHeight * 0.8,
              width: _displayWidth,
              child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.55,
                  mainAxisSpacing: 35,
                  crossAxisSpacing: 5,
                  children: List.generate(list.length, (index) {
                    return ProductItem(list[index], widget.currUser);
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
