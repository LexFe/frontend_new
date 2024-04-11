import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/common/enum/state_status.dart';
import 'package:frontend/model/admin_model.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(const AdminState()) {
    on<GetAdminEvent>((event, emit) {
      emit(state.copyWith(adminModel: event.adminModel , adminModelSearch: event.adminModel));
    });

    on<ChangeStatusEvent>((event, emit) {
      emit(state.copyWith(status: event.status));
    });

    on<SearchAdminEvent>((event, emit) {
      if (event.search.isEmpty) {
        emit(state.copyWith(adminModel: state.adminModelSearch));
      } else {
        List<AdminModel> adminModel = state.adminModelSearch
            .where((element) => element.name!
                .toLowerCase()
                .contains(event.search.toLowerCase()))
            .toList();
        emit(state.copyWith(adminModel: adminModel));
      }
    });
  }
}
