import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  final Connectivity _connectivity;
  late final StreamSubscription _subscription;

  // إضافة المتغير
  bool isConnected = true;

  InternetConnectionCubit(this._connectivity)
    : super(InternetConnectionInitial()) {
    _subscription = _connectivity.onConnectivityChanged.listen((results) {
      final result =
          results.isNotEmpty ? results.first : ConnectivityResult.none;

      if (result == ConnectivityResult.none) {
        isConnected = false; // تحديث المتغير
        emit(InternetDisconnected());
      } else {
        emit(InternetConnected(result));
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
