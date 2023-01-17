part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeBlocGetFirstInvadersEvent extends HomeEvent {}

class HomeBlocGetInvaderEvent extends HomeEvent {
  final int page;

  const HomeBlocGetInvaderEvent({required this.page});
}
