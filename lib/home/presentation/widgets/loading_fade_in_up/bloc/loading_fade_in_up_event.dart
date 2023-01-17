part of 'loading_fade_in_up_bloc.dart';

abstract class LoadingFadeInUpEvent extends Equatable {
  const LoadingFadeInUpEvent();

  @override
  List<Object> get props => [];
}

class LoadingFadeInUpShowItEvent extends LoadingFadeInUpEvent {}

class LoadingFadeInUpHideItEvent extends LoadingFadeInUpEvent {}
