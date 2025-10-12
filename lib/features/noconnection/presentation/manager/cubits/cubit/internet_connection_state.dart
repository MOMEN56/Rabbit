part of 'internet_connection_cubit.dart';

abstract class InternetConnectionState {}

class InternetConnectionInitial extends InternetConnectionState {}

class InternetConnected extends InternetConnectionState {
  final ConnectivityResult connectionType;
  InternetConnected(this.connectionType);
}

class InternetDisconnected extends InternetConnectionState {}
