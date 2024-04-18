part of 'user_bloc.dart';

class UserState extends Equatable {
    final StateStatus status;
  final List<UserModel> userModels;
  final List <UserModel> userModelsSearch;
  const UserState({
    this.status = StateStatus.loading,
    this.userModels = const <UserModel>[],
    this.userModelsSearch = const <UserModel>[],
  });

  UserState copyWith({
    StateStatus? status,
    List<UserModel>? userModels,
    List<UserModel>? userModelsSearch,
  }) {
    return UserState(
      status: status ?? this.status,
      userModels: userModels ?? this.userModels,
      userModelsSearch: userModelsSearch ?? this.userModelsSearch,
    );
  }
  
  @override
  List<Object> get props => [ status, userModels, userModelsSearch];
}


