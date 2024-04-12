import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'admin_detail_event.dart';
part 'admin_detail_state.dart';

class AdminDetailBloc extends Bloc<AdminDetailEvent, AdminDetailState> {
  AdminDetailBloc() : super(const AdminDetailState()) {
    on<ChangeName>((event, emit) {
      emit(state.copyWith(name: event.name));
    });
    on<ChangePhone>((event, emit) {
      emit(state.copyWith(phone: event.phone));
    });
    on<ChangeEmail>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<ChangePassword>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<ResetState>((event, emit) {
      emit(state.copyWith(
        name: '',
        phone: '',
        email: '',
        password: '',
      ));
    });
  }
}
