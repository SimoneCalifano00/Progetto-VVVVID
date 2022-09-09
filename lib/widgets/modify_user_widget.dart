import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:flutter/material.dart';

import 'package:new_vvvvid/screens/homepage.dart';
import 'package:new_vvvvid/screens/user_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ModifyUserContainer extends StatefulWidget {
  const ModifyUserContainer(this.currUser);
  final User currUser;

  @override
  State<ModifyUserContainer> createState() => _ModifyUserContainerState();
}

class _ModifyUserContainerState extends State<ModifyUserContainer> {
  String imagePathTemporary = "";
  String bioTemporary = "";
  Future getImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      imagePathTemporary = file!.path;
    });

    /*setState(() {
      widget.currUser.localPic = imagePath;
    });*/
  }

  void _modifyBio(String input) {
    final newBio = input;
    setState(() {
      bioTemporary = newBio;
    });
  }

  void startNewBio(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: ModifyBio(_modifyBio, widget.currUser),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void showModal() {
    showCupertinoModalPopup(
        context: context,
        barrierColor: Colors.black54,
        builder: (_) {
          return Center(
            child: Card(
              color: const Color.fromARGB(255, 252, 56, 98),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Il profilo è stato aggiornato con successo',
                          style: Theme.of(context).textTheme.labelMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Icon(
                        Icons.add_task,
                        size: 85,
                        color: Colors.white,
                      )
                    ],
                  )),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    void disregardChanges() {
      setState(() {
        imagePathTemporary = widget.currUser.localPic;
        bioTemporary = widget.currUser.bio;
      });
      Navigator.of(context).pop();
    }

    void navigation() {
      Navigator.of(context).pop();
      Navigator.of(context).pop();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserScreen(widget.currUser)),
      );

      showModal();
    }

    void acceptChanges() {
      if (imagePathTemporary != "" &&
          imagePathTemporary != widget.currUser.localPic) {
        setState(() {
          widget.currUser.localPic = imagePathTemporary;
        });
      }

      if (bioTemporary != "" && bioTemporary != widget.currUser.bio) {
        setState(() {
          widget.currUser.bio = bioTemporary;
        });
      }

      navigation();

      /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserScreen(widget.currUser)),
        ).then((res) => redirect());*/
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Salvare o rifiutare le modifiche?'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: acceptChanges,
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      child: Text('Salva modifiche'),
                    ),
                    ElevatedButton(
                        onPressed: disregardChanges,
                        child: Text('Rifiuta modifiche'),
                        style: ElevatedButton.styleFrom(primary: Colors.red)),
                  ],
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imagePathTemporary == "" && widget.currUser.localPic == ""
                      ? InkWell(
                          onTap: getImage,
                          child: Stack(
                            children: [
                              Container(
                                height: _displayHeight * 0.17,
                                width: _displayWidth * 0.36,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            widget.currUser.profilePicUrl),
                                        fit: BoxFit.cover)),
                              ),
                              Icon(
                                Icons.update,
                                color: Color.fromARGB(173, 252, 56, 98),
                                size: _displayWidth * 0.35,
                              ),
                            ],
                          ),
                        )
                      : widget.currUser.localPic != "" &&
                              imagePathTemporary == ""
                          ? InkWell(
                              onTap: getImage,
                              child: Stack(
                                children: [
                                  Container(
                                    height: _displayHeight * 0.17,
                                    width: _displayWidth * 0.36,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: FileImage(
                                                File(widget.currUser.localPic)),
                                            fit: BoxFit.cover)),
                                  ),
                                  Icon(
                                    Icons.update,
                                    color: Color.fromARGB(173, 252, 56, 98),
                                    size: _displayWidth * 0.35,
                                  ),
                                ],
                              ))
                          : InkWell(
                              onTap: getImage,
                              child: Stack(
                                children: [
                                  Container(
                                    height: _displayHeight * 0.17,
                                    width: _displayWidth * 0.36,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: FileImage(
                                                File(imagePathTemporary)),
                                            fit: BoxFit.cover)),
                                  ),
                                  Icon(
                                    Icons.update,
                                    color: Color.fromARGB(173, 252, 56, 98),
                                    size: _displayWidth * 0.35,
                                  ),
                                ],
                              ),
                            ),
                  SizedBox(
                    width: _displayWidth * 0.007,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.currUser.username,
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
                          Stack(
                            children: [
                              SizedBox(
                                height: _displayHeight * 0.12,
                                width: _displayWidth * 0.4,
                                child: SingleChildScrollView(
                                  child: InkWell(
                                    onTap: () => startNewBio(context),
                                    child: Card(
                                        color: Colors.black54,
                                        child: bioTemporary == ""
                                            ? Text(
                                                widget.currUser.bio,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2,
                                                overflow: TextOverflow.fade,
                                                textAlign: TextAlign.end,
                                              )
                                            : Text(
                                                bioTemporary,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2,
                                                overflow: TextOverflow.fade,
                                                textAlign: TextAlign.end,
                                              )),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: _displayWidth * 0.1),
                                child: Icon(
                                  Icons.update,
                                  color: Color.fromARGB(173, 252, 56, 98),
                                  size: _displayWidth * 0.2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
            SizedBox(height: _displayHeight * 0.02),
            SizedBox(
              height: _displayHeight * 0.43,
              width: _displayWidth,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Lista amici',
                          style: Theme.of(context).textTheme.labelMedium,
                          maxLines: 1,
                        ),
                        SingleChildScrollView(
                          child: SizedBox(
                            height: _displayHeight * 0.4,
                            width: _displayWidth * 0.38,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemExtent: _displayWidth * 0.2,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  dense: true,
                                  minLeadingWidth: 1,
                                  visualDensity: VisualDensity.compact,
                                  leading: CircleAvatar(
                                    foregroundImage: NetworkImage(widget
                                        .currUser
                                        .friendList![index]
                                        .profilePicUrl),
                                    backgroundColor: Colors.grey,
                                  ),
                                  title: Text(
                                    widget.currUser.friendList![index].username,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                );
                                /*return InkWell(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: _displayWidth * 0.003),
                                    child: Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            currUser
                                                                .friendList![
                                                                    index]
                                                                .profilePicUrl),
                                                        fit: BoxFit.scaleDown)),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 7,
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    right: _displayWidth * 0.02,
                                                    top: _displayHeight * 0.04),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: _displayWidth *
                                                              0.02),
                                                      child: Text(
                                                        currUser
                                                            .friendList![index]
                                                            .username,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline6,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          _displayHeight * 0.02,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                );*/
                              },
                              itemCount: widget.currUser.friendList!.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Prodotti preferiti',
                          style: Theme.of(context).textTheme.labelMedium,
                          maxLines: 1,
                        ),
                        SingleChildScrollView(
                          child: SizedBox(
                            height: _displayHeight * 0.4,
                            width: _displayWidth * 0.48,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemExtent: _displayWidth * 0.33,
                              itemBuilder: (context, index) {
                                /*return ListTile(
                                  dense: true,
                                  minLeadingWidth: 1,
                                  visualDensity: VisualDensity.compact,
                                  leading: FittedBox(
                                    fit: BoxFit.fitHeight,
                                    child: Image.network(
                                      currUser.favouriteProducts![index]
                                          .previewImgUrl,
                                    ),
                                  ),
                                  title: Text(
                                    currUser.favouriteProducts![index].title,
                                    style: Theme.of(context).textTheme.bodyText2,
                                  ),
                                );*/
                                return InkWell(
                                  child: Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: _displayHeight * 0.01),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(widget
                                                            .currUser
                                                            .favouriteProducts![
                                                                index]
                                                            .previewImgUrl),
                                                        fit: BoxFit.scaleDown)),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 7,
                                              child: Text(
                                                widget
                                                    .currUser
                                                    .favouriteProducts![index]
                                                    .title,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                );
                              },
                              itemCount:
                                  widget.currUser.favouriteProducts!.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Personaggi preferiti',
                          style: Theme.of(context).textTheme.labelMedium,
                          maxLines: 1,
                        ),
                        SingleChildScrollView(
                          child: SizedBox(
                            height: _displayHeight * 0.4,
                            width: _displayWidth * 0.48,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemExtent: _displayWidth * 0.33,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child: Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: _displayHeight * 0.01),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(widget
                                                            .currUser
                                                            .favouriteCharacters![
                                                                index]
                                                            .characterPic),
                                                        fit: BoxFit.scaleDown)),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 7,
                                              child: Text(
                                                widget
                                                    .currUser
                                                    .favouriteCharacters![index]
                                                    .name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                );
                              },
                              itemCount:
                                  widget.currUser.favouriteCharacters!.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModifyBio extends StatefulWidget {
  ModifyBio(this.modifyBioListener, this.currUser);
  final Function modifyBioListener;
  final User currUser;

  @override
  State<ModifyBio> createState() => _ModifyBioState();
}

class _ModifyBioState extends State<ModifyBio> {
  void showToast(String errMex) {
    Fluttertoast.showToast(
        msg: errMex,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black87,
        textColor: Colors.white);
  }

  final _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _displayWidth = MediaQuery.of(context).size.width;
    final _displayHeight = MediaQuery.of(context).size.height;
    void _submitBio() {
      final commentInput = _bioController.text;
      if (commentInput.isEmpty) {
        showToast('Impossibile inserire una bio vuota');
        return;
      }
      widget.modifyBioListener(commentInput);

      Navigator.of(context).pop();
    }

    return SingleChildScrollView(
      child: Card(
        color: Colors.black26,
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              SizedBox(
                height: _displayHeight * 0.02,
              ),
              TextField(
                minLines: 1,
                maxLines: 5,
                autofocus: true,
                cursorColor: const Color.fromARGB(255, 252, 56, 98),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: _submitBio,
                        icon: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.white),
                        iconSize: 20),
                    labelText: "Scrivi una nuova bio",
                    labelStyle: Theme.of(context).textTheme.headline4,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                    )),
                    border: InputBorder.none,
                    isDense: true),
                style: Theme.of(context).textTheme.bodyText2,
                controller: _bioController,
                onSubmitted: (_) => _submitBio(),
              ),
              SizedBox(
                height: _displayHeight * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
