import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class BlocObserverService implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('${bloc.runtimeType} $change');
  }

  @override
  void onClose(BlocBase bloc) {
    log('${bloc.runtimeType} closed');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('${bloc.runtimeType} created');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('${bloc.runtimeType} $error $stackTrace');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('${bloc.runtimeType} $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('${bloc.runtimeType} $transition');
  }
}
