part of 'admin_bloc.dart';

class AdminState extends Equatable {
  final List<AdminModel> adminModel;
  final List<AdminModel> adminModelSearch;
  final StateStatus status;
  const AdminState({
    this.adminModel = const <AdminModel> [],
    this.adminModelSearch = const <AdminModel> [],
    this.status = StateStatus.loading,
  });

  AdminState copyWith({
    List<AdminModel>? adminModel,
    List<AdminModel>? adminModelSearch,
    StateStatus? status,
  }) {
    return AdminState(
      adminModel: adminModel ?? this.adminModel,
      adminModelSearch: adminModelSearch ?? this.adminModelSearch,
      status: status ?? this.status,
    );
  }
  
  @override
  List<Object> get props => [ adminModel, adminModelSearch, status];
}

