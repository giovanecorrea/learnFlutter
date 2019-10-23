import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_todos/pages/homeBloc/index.dart';
import 'dart:developer' as developer;

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  // todo: check singleton for logic in project
  static final HomeBlocBloc _homeBlocBlocSingleton = HomeBlocBloc._internal();
  factory HomeBlocBloc() {
    return _homeBlocBlocSingleton;
  }
  HomeBlocBloc._internal();
  
  @override
  dispose(){
    _homeBlocBlocSingleton.dispose();
    super.dispose();
  }

  HomeBlocState get initialState => UnHomeBlocState(0);

  @override
  Stream<HomeBlocState> mapEventToState(
    HomeBlocEvent event,
  ) async* {
    try {
      yield await event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'HomeBlocBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
