part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState(this.invaderList);
  final InvaderList invaderList;

  @override
  List<Object> get props => [invaderList];
}

class HomeInitialState extends HomeState {
  const HomeInitialState(invaders) : super(invaders);
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState(InvaderList invaders) : super(invaders);
}

class HomeLoadedState extends HomeState {
  const HomeLoadedState(InvaderList invaders) : super(invaders);
}

class HomeEmptyState extends HomeState {
  const HomeEmptyState(InvaderList invaders) : super(invaders);
}

class HomeFailedState extends HomeState {
  const HomeFailedState(InvaderList invaders) : super(invaders);
}
