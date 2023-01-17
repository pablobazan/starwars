part of 'internet_drawer_bloc.dart';

abstract class InternetDrawerEvent extends Equatable {
  const InternetDrawerEvent();

  @override
  List<Object> get props => [];
}

class InternetDrawerChangeInternetConnectionEvent extends InternetDrawerEvent {
  final bool value;

  const InternetDrawerChangeInternetConnectionEvent({required this.value});

  @override
  List<Object> get props => [value];
}
