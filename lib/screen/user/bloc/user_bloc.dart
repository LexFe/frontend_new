import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/common/enum/state_status.dart';
import 'package:frontend/model/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<GetUser>((event, emit) {
      emit(state.copyWith(
        userModels: event.userModels,
        userModelsSearch: event.userModels,
      ));
    });

    on<ChangeStatusEvent>((event, emit) {
      emit(state.copyWith(
        status: event.status,
      ));
    });

    on<SearchUser>((event, emit) {
      if (event.search.isEmpty) {
        emit(state.copyWith(userModels: state.userModelsSearch));
      } else {
        List<UserModel> userModel = state.userModelsSearch
            .where((element) => element.name!
                .toLowerCase()
                .contains(event.search.toLowerCase()))
            .toList();
        emit(state.copyWith(userModels: userModel));
      }
    });
  }
}
