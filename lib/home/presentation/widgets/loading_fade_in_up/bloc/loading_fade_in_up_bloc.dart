import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loading_fade_in_up_event.dart';
part 'loading_fade_in_up_state.dart';

class LoadingFadeInUpBloc
    extends Bloc<LoadingFadeInUpEvent, LoadingFadeInUpState> {
  LoadingFadeInUpBloc()
      : super(const LoadingFadeInUpLoading(isShowing: false)) {
    on<LoadingFadeInUpHideItEvent>((event, emit) {
      emit(const LoadingFadeInUpLoading(isShowing: false));
    });
    on<LoadingFadeInUpShowItEvent>((event, emit) {
      emit(const LoadingFadeInUpLoading(isShowing: true));
    });
  }
}
