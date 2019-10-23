import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/pages/homeBloc/index.dart';

class HomeBlocScreen extends StatefulWidget {
  const HomeBlocScreen({
    Key key,
    @required HomeBlocBloc homeBlocBloc,
  })  : _homeBlocBloc = homeBlocBloc,
        super(key: key);

  final HomeBlocBloc _homeBlocBloc;

  @override
  HomeBlocScreenState createState() {
    return HomeBlocScreenState(_homeBlocBloc);
  }
}

class HomeBlocScreenState extends State<HomeBlocScreen> {
  final HomeBlocBloc _homeBlocBloc;
  HomeBlocScreenState(this._homeBlocBloc);

  @override
  void initState() {
    super.initState();
    this._load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBlocBloc, HomeBlocState>(
        bloc: widget._homeBlocBloc,
        builder: (
          BuildContext context,
          HomeBlocState currentState,
        ) {
          if (currentState is UnHomeBlocState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorHomeBlocState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ?? 'Error'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text("reload"),
                    onPressed: () => this._load(),
                  ),
                ),
              ],
            ));
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Flutter files: done"),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.red,
                    child: Text("throw error"),
                    onPressed: () => this._load(true),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _load([bool isError = false]) {
    widget._homeBlocBloc.dispatch(UnHomeBlocEvent());
    widget._homeBlocBloc.dispatch(LoadHomeBlocEvent(isError));
  }
}
