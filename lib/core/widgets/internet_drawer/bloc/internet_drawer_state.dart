part of 'internet_drawer_bloc.dart';

abstract class InternetDrawerState extends Equatable {
  final bool enableInternetConnection;

  const InternetDrawerState({required this.enableInternetConnection});

  @override
  List<Object> get props => [enableInternetConnection];
}

class InternetDrawerInitial extends InternetDrawerState {
  const InternetDrawerInitial({required bool enableInternetConnection})
      : super(enableInternetConnection: enableInternetConnection);
}
