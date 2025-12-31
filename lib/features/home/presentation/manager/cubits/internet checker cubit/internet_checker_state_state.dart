part of 'internet_checker_state_cubit.dart';

abstract class InternetCheckerStateState {}

class InternetInitial extends InternetCheckerStateState {}

class InternetDisconnected extends InternetCheckerStateState {}

class InternetChecking extends InternetCheckerStateState {}

class InternetConnected extends InternetCheckerStateState {}

class InternetNoAccess extends InternetCheckerStateState {}
