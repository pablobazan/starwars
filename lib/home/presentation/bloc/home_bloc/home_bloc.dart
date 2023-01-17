import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/home/domain/entities/invader.dart';
import 'package:starwars/home/domain/use_cases/invaders/get_invaders.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetInvaders useCaseGetInvaders;

  HomeBloc({required this.useCaseGetInvaders})
      : super(const HomeInitialState(InvaderList(count: 0, invaders: []))) {
    on<HomeBlocGetFirstInvadersEvent>(getFirstInvasors);
    on<HomeBlocGetInvaderEvent>(getInvasors);
  }

  Future<void> getFirstInvasors(
      HomeBlocGetFirstInvadersEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState(state.invaderList));

    const pageOne = 1;
    final result = await useCaseGetInvaders.call(const Params(page: pageOne));
    result.fold((failure) {
      emit(HomeFailedState(state.invaderList));
    }, (invaderList) {
      emit(HomeLoadedState(invaderList));
    });
  }

  Future<void> getInvasors(
      HomeBlocGetInvaderEvent event, Emitter<HomeState> emit) async {
    final result = await useCaseGetInvaders.call(Params(page: event.page));
    result.fold((failure) {
      emit(HomeFailedState(state.invaderList));
    }, (invaderList) {
      InvaderList newInvaderList = state.invaderList.copyWith(
          invaders: state.invaderList.invaders + invaderList.invaders);
      emit(HomeLoadedState(newInvaderList));
    });
  }
}
