import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log(' Created -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log("An event Happened in $bloc the event is $event");
  }

  // @override
  // void onTransition(
  //   Bloc<dynamic, dynamic> bloc,
  //   Transition<dynamic, dynamic> transition,
  // ) {
  //   super.onTransition(bloc, transition);
  //   log("A transition Happened in $bloc the transition is $transition");
  // }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log("An error Happened in $bloc the error is $error");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('Closed -- ${bloc.runtimeType}');
  }
}
