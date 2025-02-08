import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ConnectionStatus { connected, disconnected }

class InternetCheckerState {
  final ConnectionStatus connectionStatus;
  InternetCheckerState({required this.connectionStatus});
}

class InternetCheckerCubit extends Cubit<InternetCheckerState> {
  InternetCheckerCubit()
      : super(
          InternetCheckerState(
            connectionStatus: ConnectionStatus.disconnected,
          ),
        );

  Future<void> checkConnection() async {
    var connectiviityResult = await Connectivity().checkConnectivity();
    _updateConnectionStatus(connectiviityResult);
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectiviityResult) {
    if (connectiviityResult.isEmpty ||
        connectiviityResult.contains(
          ConnectivityResult.none,
        )) {
      emit(
        InternetCheckerState(
          connectionStatus: ConnectionStatus.disconnected,
        ),
      );
    } else {
      emit(
        InternetCheckerState(
          connectionStatus: ConnectionStatus.connected,
        ),
      );
    }
  }

  late StreamSubscription<List<ConnectivityResult>> _subscription;
  void trackConnection() {
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      _updateConnectionStatus(result);
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
