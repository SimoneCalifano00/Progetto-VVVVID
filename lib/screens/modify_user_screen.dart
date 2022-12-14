import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/widgets/appbarAndScreenViewer.dart';
import 'package:new_vvvvid/widgets/modify_user_widget.dart';

class ModifyUserScreen extends StatelessWidget {
  const ModifyUserScreen(this.currUser);
  final User currUser;

  @override
  Widget build(BuildContext context) {
    return AppbarAndScreen(ModifyUserContainer(currUser), currUser);
  }
}
