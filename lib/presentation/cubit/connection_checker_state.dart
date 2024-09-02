part of 'connection_checker_cubit.dart';

enum ConnectionStatus {
  connected,
  disconnected
}

@freezed
class ConnectionCheckerState with _$ConnectionCheckerState {
  const factory ConnectionCheckerState.initial() = _Initial;
  const factory ConnectionCheckerState.status(ConnectionStatus status) = _Status;
  const factory ConnectionCheckerState.error(String message) = _Error;
}
