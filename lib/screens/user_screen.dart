import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/widgets/appbarAndScreenViewer.dart';
import 'package:new_vvvvid/widgets/user_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen(this.currUser);

  static const String routePath = '/User';

  final User currUser;

  @override
  Widget build(BuildContext context) {
    return AppbarAndScreen(UserContainer(currUser), currUser);
  }
}
