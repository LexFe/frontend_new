import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'predict_detail_event.dart';
part 'predict_detail_state.dart';

class PredictDetailBloc extends Bloc<PredictDetailEvent, PredictDetailState> {
  PredictDetailBloc() : super(PredictDetailInitial()) {
    on<PredictDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
