import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  UserDetailBloc() : super(const UserDetailState()) {
    on<ChangeName>((event, emit) {
      emit(state.copyWith(
        name: event.name,
      ));
    });

    on<ChangePhone>((event, emit) {
      emit(state.copyWith(
        phone: event.phone,
      ));
    });

    on<ChangePregnancies>((event, emit) {
      emit(state.copyWith(
        pregnancies: event.pregnancies,
      ));
    });

    on<ChangeGlucose>((event, emit) {
      emit(state.copyWith(
        glucose: event.glucose,
      ));
    });

    on<ChangeBloodPressure>((event, emit) {
      emit(state.copyWith(
        bloodPressure: event.bloodPressure,
      ));
    });

    on<ChangeSkinThickness>((event, emit) {
      emit(state.copyWith(
        skinThickness: event.skinThickness,
      ));
    });

    on<ChangeInsulin>((event, emit) {
      emit(state.copyWith(
        insulin: event.insulin,
      ));
    });

    on<ChangeBmi>((event, emit) {
      emit(state.copyWith(
        bmi: event.bmi,
      ));
    });

    on<ChangeAge>((event, emit) {
      emit(state.copyWith(
        age: event.age,
      ));
    });

    on<ChangeDiabetesPedigreeFunction>((event, emit) {
      emit(state.copyWith(
        diabetesPedigreeFunction: event.diabetesPedigreeFunction,
      ));
    });
  }
}
