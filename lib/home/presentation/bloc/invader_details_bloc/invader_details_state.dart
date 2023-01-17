part of 'invader_details_bloc.dart';

abstract class InvaderDetailsState extends Equatable {
  const InvaderDetailsState();

  @override
  List<Object> get props => [];
}

class InvaderDetailsInitialState extends InvaderDetailsState {}

class InvaderDetailsReportSentState extends InvaderDetailsState {}
