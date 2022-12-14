import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/widgets/appbarAndScreenViewer.dart';
import 'package:new_vvvvid/widgets/other_user_widget.dart';
import 'package:new_vvvvid/widgets/user_widget.dart';

class OtherUserScreen extends StatelessWidget {
  const OtherUserScreen(this.pageUser, this.currUser);
  final User currUser;
  final User pageUser;

  @override
  Widget build(BuildContext context) {
    if (currUser.id == pageUser.id) {
      return AppbarAndScreen(UserContainer(currUser), currUser);
    } else {
      return AppbarAndScreen(OtherUserContainer(pageUser, currUser), currUser);
    }
  }
}
