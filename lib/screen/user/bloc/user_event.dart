part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends UserEvent {
  final List<UserModel> userModels;
  const GetUser({
    required this.userModels,
  });

  @override
  List<Object> get props => [userModels];
}

class ChangeStatusEvent extends UserEvent {
  final StateStatus status;
  const ChangeStatusEvent({
    required this.status,
  });

  @override
  List<Object> get props => [status];
}

class SearchUser extends UserEvent {
  final String search;
  const SearchUser({
    required this.search,
  });

  @override
  List<Object> get props => [search];
}
