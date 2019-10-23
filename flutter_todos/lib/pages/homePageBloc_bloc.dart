import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_todos/pages/index.dart';
import 'dart:developer' as developer;

class HomePageBlocBloc extends Bloc<HomePageBlocEvent, HomePageBlocState> {
  // todo: check singleton for logic in project
  static final HomePageBlocBloc _homePageBlocBlocSingleton = HomePageBlocBloc._internal();
  factory HomePageBlocBloc() {
    return _homePageBlocBlocSingleton;
  }
  HomePageBlocBloc._internal();
  
  @override
  dispose(){
    _homePageBlocBlocSingleton.dispose();
    super.dispose();
  }

  HomePageBlocState get initialState => UnHomePageBlocState(0);

  @override
  Stream<HomePageBlocState> mapEventToState(
    HomePageBlocEvent event,
  ) async* {
    try {
      yield await event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'HomePageBlocBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
