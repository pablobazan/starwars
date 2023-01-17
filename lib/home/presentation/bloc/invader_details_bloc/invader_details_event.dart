part of 'invader_details_bloc.dart';

abstract class InvaderDetailsEvent extends Equatable {
  const InvaderDetailsEvent();

  @override
  List<Object> get props => [];
}

class InvaderDetailsSendReportEvent extends InvaderDetailsEvent {
  final int userid;
  final DateTime dateTime;
  final String characterName;
  const InvaderDetailsSendReportEvent({
    required this.userid,
    required this.dateTime,
    required this.characterName,
  });

  @override
  List<Object> get props => [userid];
}
