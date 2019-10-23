import 'dart:async';
import 'package:flutter_todos/pages/homeBloc/index.dart';
import 'package:meta/meta.dart';
import 'dart:developer' as developer;

@immutable
abstract class HomeBlocEvent {
  Future<HomeBlocState> applyAsync(
      {HomeBlocState currentState, HomeBlocBloc bloc});
  final HomeBlocRepository _homeBlocRepository = HomeBlocRepository();
}

class UnHomeBlocEvent extends HomeBlocEvent {
  @override
  Future<HomeBlocState> applyAsync({HomeBlocState currentState, HomeBlocBloc bloc}) async {
    return UnHomeBlocState(0);
  }
}

class LoadHomeBlocEvent extends HomeBlocEvent {
   
  final bool isError;
  @override
  String toString() => 'LoadHomeBlocEvent';

  LoadHomeBlocEvent(this.isError);

  @override
  Future<HomeBlocState> applyAsync(
      {HomeBlocState currentState, HomeBlocBloc bloc}) async {
    try {
      if (currentState is InHomeBlocState) {
        return currentState.getNewVersion();
      }
      await Future.delayed(Duration(seconds: 2));
      this._homeBlocRepository.test(this.isError);
      return InHomeBlocState(0, "Hello world");
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadHomeBlocEvent', error: _, stackTrace: stackTrace);
      return ErrorHomeBlocState(0, _?.toString());
    }
  }
}
