import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_vvvvid/models/comment.dart';
import 'package:new_vvvvid/models/user.dart';

class NewReply extends StatefulWidget {
  final Function newReplyListener;
  final User currUser;
  final Comment comment;
  const NewReply(this.newReplyListener, this.currUser, this.comment);

  @override
  State<NewReply> createState() => _NewReplyState();
}

class _NewReplyState extends State<NewReply> {
  void showToast(String errMex) {
    Fluttertoast.showToast(
        msg: errMex,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black87,
        textColor: Colors.white);
  }

  final _replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _displayWidth = MediaQuery.of(context).size.width;
    final _displayHeight = MediaQuery.of(context).size.height;
    void _submitReply() {
      final replyInput = _replyController.text;
      if (replyInput.isEmpty) {
        showToast('Impossibile inserire una risposta vuota');
        return;
      }
      widget.newReplyListener(replyInput);

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
              Text(
                '"' + widget.comment.text + '"',
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: _displayHeight * 0.02,
              ),
              TextField(
                minLines: 1,
                maxLines: 5,
                autofocus: true,
                cursorColor: const Color.fromARGB(255, 252, 56, 98),
                decoration: InputDecoration(
                    icon: CircleAvatar(
                        foregroundImage:
                            NetworkImage(widget.currUser.profilePicUrl),
                        backgroundColor: Colors.grey,
                        radius: _displayWidth * 0.08),
                    suffixIcon: IconButton(
                        onPressed: _submitReply,
                        icon: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.white),
                        iconSize: 20),
                    labelText: "Scrivi una risposta",
                    labelStyle: Theme.of(context).textTheme.headline4,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                    )),
                    border: InputBorder.none,
                    isDense: true),
                style: Theme.of(context).textTheme.bodyText2,
                controller: _replyController,
                onSubmitted: (_) => _submitReply(),
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
