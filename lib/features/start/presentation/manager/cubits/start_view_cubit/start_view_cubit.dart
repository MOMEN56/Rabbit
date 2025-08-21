import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabbit/features/start/presentation/manager/cubits/start_view_cubit/start_view_state.dart';

class StartViewCubit extends Cubit<StartViewState> {
  StartViewCubit() : super(StartViewButtonState());
  void showStartButton() {
    emit(StartViewButtonState());
  }

  void showRocketAnimation() {
    emit(StartViewRocketAnimationState());

    Future.delayed(const Duration(seconds: 3), () {
      emit(StartViewNavigateToHomeState());
    });
  }
}
