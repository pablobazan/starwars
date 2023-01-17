import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars/home/domain/use_cases/invaders/post_invader_report.dart';

part 'invader_details_event.dart';
part 'invader_details_state.dart';

class InvaderDetailsBloc
    extends Bloc<InvaderDetailsEvent, InvaderDetailsState> {
  final PostInvaderReport useCasePostInvaderReport;

  InvaderDetailsBloc({
    required this.useCasePostInvaderReport,
  }) : super(InvaderDetailsInitialState()) {
    on<InvaderDetailsSendReportEvent>(sendReport);
  }

  Future<void> sendReport(InvaderDetailsSendReportEvent event,
      Emitter<InvaderDetailsState> emit) async {
    final result = await useCasePostInvaderReport.call(Params(
      userId: event.userid,
      dateTime: event.dateTime.toString(),
      characterName: event.characterName,
    ));

    result.fold((failure) {}, (invaderReport) {
      emit(InvaderDetailsReportSentState());
      emit(InvaderDetailsInitialState());
    });
  }
}
