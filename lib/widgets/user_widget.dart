import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/user.dart';

class UserContainer extends StatelessWidget {
  const UserContainer(this.currUser);

  final User currUser;

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
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: _displayHeight * 0.17,
                  width: _displayWidth * 0.36,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(currUser.profilePicUrl),
                          fit: BoxFit.scaleDown)),
                ),
                SizedBox(
                  width: _displayWidth * 0.007,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currUser.username,
                      style: Theme.of(context).textTheme.headline6,
                      overflow: TextOverflow.fade,
                    ),
                    SizedBox(
                      height: _displayHeight * 0.008,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: _displayHeight * 0.12,
                          width: _displayWidth * 0.4,
                          child: SingleChildScrollView(
                            child: Text(
                              currUser.bio,
                              style: Theme.of(context).textTheme.bodyText2,
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings),
                    color: const Color.fromARGB(255, 252, 56, 98),
                    iconSize: 35),
              ]),
        ],
      )),
    );
  }
}
