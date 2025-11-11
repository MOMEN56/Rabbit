import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'internet_checker_state_state.dart';

class InternetCheckerStateCubit extends Cubit<InternetCheckerStateState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;
  StreamSubscription? _internetSubscription;
  bool _hasNetwork = false; // لتتبع هل في شبكة متاحة أصلاً

  InternetCheckerStateCubit() : super(InternetInitial()) {
    _monitorConnectivity();
    _monitorInternetStatus();
  }
  InternetCheckerStateState? previousState;

  void _emitWithPrevious(InternetCheckerStateState newState) {
    previousState = state;
    emit(newState);
  }

  void _monitorConnectivity() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      final result =
          results.isNotEmpty ? results.first : ConnectivityResult.none;

      if (result == ConnectivityResult.none) {
        _hasNetwork = false;
        emit(InternetDisconnected());
      } else {
        _hasNetwork = true;
        emit(InternetChecking());
      }
    });
  }

  void _monitorInternetStatus() {
    _internetSubscription = InternetConnection().onStatusChange.listen((
      status,
    ) {
      // 👇 لا تتحقق من الإنترنت إذا ما فيش شبكة أصلًا
      if (!_hasNetwork) return;

      if (status == InternetStatus.connected) {
        emit(InternetConnected());
      } else {
        emit(InternetNoAccess());
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    _internetSubscription?.cancel();
    return super.close();
  }
}
