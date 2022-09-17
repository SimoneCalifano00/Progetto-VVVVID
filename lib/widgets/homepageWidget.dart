import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:new_vvvvid/main.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/widgets/appbarAndScreenViewer.dart';
import 'carousel.dart';
import '../models/dummy_products.dart';
import '../models/user.dart';

class HomepageContainer extends StatefulWidget {
  HomepageContainer(this.currUser);
  final User currUser;

  @override
  State<HomepageContainer> createState() => _HomepageContainerState();
}

class _HomepageContainerState extends State<HomepageContainer> {
  String greetings() {
    DateTime now = DateTime.now();
    String greet = '';
    if (now.hour >= 6 && now.hour <= 12) {
      greet = 'Buongiorno, ';
    }
    if (now.hour >= 13 && now.hour <= 18) {
      greet = 'Buon Pomeriggio, ';
    }
    if (now.hour >= 19 || now.hour <= 5) {
      greet = 'Buonasera, ';
    }

    return greet;
  }

  List<Products> getWatchLaterList(User user) {
    return user.guardaPiuTardi;
  }

  List<Products> getContinuaGuardare(User user) {
    return user.continuaAGuardare;
  }

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;
    final _displayPaddingBottom = MediaQuery.of(context).padding.bottom;
    final _displayPaddingTop = MediaQuery.of(context).padding.top;

    List<Products> guardaPiuTardiList = getWatchLaterList(widget.currUser);
    List<Products> continuaAGuardareList = getContinuaGuardare(widget.currUser);

    setState(() {
      guardaPiuTardiList.add;
      continuaAGuardareList.add;
    });

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
                height: _displayHeight * 0.002,
              ),
              Text(
                greetings() +
                    widget.currUser.username +
                    widget.currUser.id.toString(),
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: _displayHeight * 0.045,
              ),
              widget.currUser.continuaAGuardare.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Continua a guardare',
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ),
                        Container(
                          width: _displayWidth,
                          height: _displayHeight * 0.335,
                          child: Carousel(getContinuaGuardare(widget.currUser),
                              widget.currUser),
                        )
                      ],
                    )
                  : SizedBox(),
              SizedBox(
                height: _displayHeight * 0.045,
              ),
              getWatchLaterList(widget.currUser).isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Guarda più tardi',
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ),
                        Container(
                          width: _displayWidth,
                          height: _displayHeight * 0.335,
                          child: Carousel(getWatchLaterList(widget.currUser),
                              widget.currUser),
                        )
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Guarda più tardi',
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ),
                        Container(
                            width: _displayWidth,
                            height: _displayHeight * 0.335,
                            child: Text(
                                'Puoi aggiungere elementi a questa lista dalla pagina di un prodotto che vuoi guardare più tardi!'))
                      ],
                    ),
            ],
          ),
        ));
  }
}
