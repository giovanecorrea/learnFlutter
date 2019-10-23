import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeBlocState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final Iterable propss;
  HomeBlocState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  HomeBlocState getStateCopy();

  HomeBlocState getNewVersion();

  @override
  List<Object> get props => (propss);
}

/// UnInitialized
class UnHomeBlocState extends HomeBlocState {

  UnHomeBlocState(version) : super(version);

  @override
  String toString() => 'UnHomeBlocState';

  @override
  UnHomeBlocState getStateCopy() {
    return UnHomeBlocState(0);
  }

  @override
  UnHomeBlocState getNewVersion() {
    return UnHomeBlocState(version+1);
  }
}

/// Initialized
class InHomeBlocState extends HomeBlocState {
  final String hello;

  InHomeBlocState(version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InHomeBlocState $hello';

  @override
  InHomeBlocState getStateCopy() {
    return InHomeBlocState(this.version, this.hello);
  }

  @override
  InHomeBlocState getNewVersion() {
    return InHomeBlocState(version+1, this.hello);
  }
}

class ErrorHomeBlocState extends HomeBlocState {
  final String errorMessage;

  ErrorHomeBlocState(version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorHomeBlocState';

  @override
  ErrorHomeBlocState getStateCopy() {
    return ErrorHomeBlocState(this.version, this.errorMessage);
  }

  @override
  ErrorHomeBlocState getNewVersion() {
    return ErrorHomeBlocState(version+1, this.errorMessage);
  }
}
