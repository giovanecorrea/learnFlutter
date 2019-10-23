import 'package:flutter/material.dart';
import 'package:flutter_todos/pages/index.dart';

class HomePagePage extends StatelessWidget {
  static const String routeName = "/homePage";

  @override
  Widget build(BuildContext context) {
    var _homePageBloc = HomePageBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: HomePageScreen(homePageBloc: _homePageBloc),
    );
  }
}
