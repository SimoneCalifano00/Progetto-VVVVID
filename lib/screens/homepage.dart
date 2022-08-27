import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);
  static const routePath = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text('mucho texto')),
    );
  }
}
