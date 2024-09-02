import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_checker_cubit.freezed.dart';
part 'connection_checker_state.dart';

class ConnectionCheckerCubit extends Cubit<ConnectionCheckerState> {
  ConnectionCheckerCubit() : super(const ConnectionCheckerState.disconnected());

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
      emit(const ConnectionCheckerState.disconnected());
    } else {
      emit(const ConnectionCheckerState.disconnected());
    }
  }

  late StreamSubscription<List<ConnectivityResult>?> subscription;

  void trackConnectivityChange() {
    subscription = Connectivity().onConnectivityChanged.listen(
      (result) {
        updateConnectivityStatus(result.first);
      },
    );
  }
}
