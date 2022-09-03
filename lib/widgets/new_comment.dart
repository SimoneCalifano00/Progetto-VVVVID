import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_vvvvid/models/user.dart';

class NewComment extends StatefulWidget {
  final Function newCommentListener;
  final User currUser;
  const NewComment(this.newCommentListener, this.currUser);

  @override
  State<NewComment> createState() => _NewCommentState();
}

class _NewCommentState extends State<NewComment> {
  void showToast(String errMex) {
    Fluttertoast.showToast(
        msg: errMex,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black87,
        textColor: Colors.white);
  }

  final _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _displayWidth = MediaQuery.of(context).size.width;
    final _displayHeight = MediaQuery.of(context).size.height;
    void _submitComment() {
      final commentInput = _commentController.text;
      if (commentInput.isEmpty) {
        showToast('Impossibile inserire un commento vuoto');
        return;
      }
      widget.newCommentListener(commentInput);

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
                    icon: widget.currUser.localPic == ""
                        ? CircleAvatar(
                            foregroundImage:
                                NetworkImage(widget.currUser.profilePicUrl),
                            backgroundColor: Colors.grey,
                            radius: _displayWidth * 0.08)
                        : CircleAvatar(
                            foregroundImage:
                                NetworkImage(widget.currUser.localPic),
                            backgroundColor: Colors.grey,
                            radius: _displayWidth * 0.08),
                    suffixIcon: IconButton(
                        onPressed: _submitComment,
                        icon: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.white),
                        iconSize: 20),
                    labelText: "Scrivi un commento...",
                    labelStyle: Theme.of(context).textTheme.headline4,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                    )),
                    border: InputBorder.none,
                    isDense: true),
                style: Theme.of(context).textTheme.bodyText2,
                controller: _commentController,
                onSubmitted: (_) => _submitComment(),
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
