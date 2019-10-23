import 'package:flutter/material.dart';
import 'package:flutter_todos/pages/homeBloc/index.dart';

class HomeBlocPage extends StatelessWidget {
  static const String routeName = "/homeBloc";

  @override
  Widget build(BuildContext context) {
    var _homeBlocBloc = HomeBlocBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeBloc"),
      ),
      body: HomeBlocScreen(homeBlocBloc: _homeBlocBloc),
    );
  }
}
