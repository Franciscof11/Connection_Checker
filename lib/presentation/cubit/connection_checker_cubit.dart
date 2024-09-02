import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'connection_checker_cubit.freezed.dart';
part 'connection_checker_state.dart';

class ConnectionCheckerCubit extends Cubit<ConnectionCheckerState> {
  ConnectionCheckerCubit() : super(const ConnectionCheckerState.status(ConnectionStatus.disconnected));

  void checkConnectivity() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();

      debugPrint(connectivityResult.first.toString());

      updateConnectivityStatus(connectivityResult.first);
    } catch (e) {
      emit(ConnectionCheckerState.error(e.toString()));
    }
  }

  void updateConnectivityStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      emit(const ConnectionCheckerState.status(ConnectionStatus.disconnected));
    } else {
      emit(const ConnectionCheckerState.status(ConnectionStatus.connected));
    }
  }

  late StreamSubscription<List<ConnectivityResult>?> subscription;

  void trackConnectivityChange() {
    final connectionChecker = InternetConnectionChecker();

    subscription = Connectivity().onConnectivityChanged.listen(
      (result) {
        connectionChecker.onStatusChange.listen(
          (InternetConnectionStatus status) {
            if (status == InternetConnectionStatus.connected) {
              updateConnectivityStatus(result.first);
              debugPrint('tem net kkk');
            } else {
              updateConnectivityStatus(ConnectivityResult.none);
              debugPrint('SEM NET!!');
            }
          },
        );
      },
    );
  }
}
