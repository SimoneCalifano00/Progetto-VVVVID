import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/widgets/appbarAndScreenViewer.dart';
import 'package:new_vvvvid/widgets/generi_widget.dart';

class GeneriScreen extends StatelessWidget {
  const GeneriScreen(this.genere, this.currUser, this.sezione);
  final User currUser;
  final String genere;
  final Sezione sezione;

  @override
  Widget build(BuildContext context) {
    return AppbarAndScreen(
        GeneriContainer(genere, currUser, sezione), currUser);
  }
}
