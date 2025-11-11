part of 'internet_checker_state_cubit.dart';

abstract class InternetCheckerStateState {}

class InternetInitial extends InternetCheckerStateState {}

/// لا يوجد أي اتصال (Wi-Fi أو بيانات)
class InternetDisconnected extends InternetCheckerStateState {}

/// متصل بشبكة ولكن لم نتحقق بعد من الوصول للإنترنت
class InternetChecking extends InternetCheckerStateState {}

/// متصل فعليًا بالإنترنت
class InternetConnected extends InternetCheckerStateState {}

/// متصل بشبكة ولكن بدون إنترنت فعلي
class InternetNoAccess extends InternetCheckerStateState {}
