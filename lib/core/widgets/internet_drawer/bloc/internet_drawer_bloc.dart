import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'internet_drawer_event.dart';
part 'internet_drawer_state.dart';

class InternetDrawerBloc
    extends Bloc<InternetDrawerEvent, InternetDrawerState> {
  InternetDrawerBloc()
      : super(const InternetDrawerInitial(enableInternetConnection: false)) {
    on<InternetDrawerChangeInternetConnectionEvent>(changeInternetConnection);
  }

  void changeInternetConnection(
      InternetDrawerChangeInternetConnectionEvent event,
      Emitter<InternetDrawerState> emit) async {
    emit(InternetDrawerInitial(enableInternetConnection: event.value));
  }
}
