part of 'connection_checker_cubit.dart';

@freezed
class ConnectionCheckerState with _$ConnectionCheckerState {
  const factory ConnectionCheckerState.initial() = _Initial;
  const factory ConnectionCheckerState.connected() = _Connected;
  const factory ConnectionCheckerState.disconnected() = _Disconnected;
  const factory ConnectionCheckerState.error(String message) = _Error;
}
