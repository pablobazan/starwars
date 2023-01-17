part of 'loading_fade_in_up_bloc.dart';

abstract class LoadingFadeInUpState extends Equatable {
  final bool isShowing;
  const LoadingFadeInUpState({required this.isShowing});

  @override
  List<Object> get props => [isShowing];
}

class LoadingFadeInUpLoading extends LoadingFadeInUpState {
  const LoadingFadeInUpLoading({required bool isShowing})
      : super(isShowing: isShowing);
}
