import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabbit/features/home/presentation/manger/cubit/cubit/start_view_state.dart';

class StartViewCubit extends Cubit<StartViewState> {
  StartViewCubit() : super(StartViewBottomState());
  void showStartBottom() {
    emit(StartViewBottomState());
  }

  void showRocketAnimation() {
    emit(StartViewRocketAnimationState());
  }
}
