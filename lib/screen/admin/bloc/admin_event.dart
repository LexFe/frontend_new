part of 'admin_bloc.dart';

sealed class AdminEvent extends Equatable {
  const AdminEvent();

  @override
  List<Object> get props => [];
}

class GetAdminEvent extends AdminEvent {
  final List<AdminModel> adminModel;
  const GetAdminEvent({
    required this.adminModel,
  });

  @override
  List<Object> get props => [adminModel];
}

class ChangeStatusEvent extends AdminEvent {
  final StateStatus status;
  const ChangeStatusEvent({
    required this.status,
  });

  @override
  List<Object> get props => [status];
}

class SearchAdminEvent extends AdminEvent {
  final String search;
  const SearchAdminEvent({
    required this.search,
  });

  @override
  List<Object> get props => [search];
}
