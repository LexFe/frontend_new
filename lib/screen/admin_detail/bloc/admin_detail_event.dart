part of 'admin_detail_bloc.dart';

sealed class AdminDetailEvent extends Equatable {
  const AdminDetailEvent();

  @override
  List<Object> get props => [];
}

class ChangeName extends AdminDetailEvent {
  final String name;

  const ChangeName({required this.name});

  @override
  List<Object> get props => [name];
}

class ChangePhone extends AdminDetailEvent {
  final String phone;

  const ChangePhone({required this.phone});

  @override
  List<Object> get props => [phone];
}

class ChangeEmail extends AdminDetailEvent {
  final String email;

  const ChangeEmail({required this.email});

  @override
  List<Object> get props => [email];
}

class ChangePassword extends AdminDetailEvent {
  final String password;

  const ChangePassword({required this.password});

  @override
  List<Object> get props => [password];
}

class ResetState extends AdminDetailEvent {
  const ResetState();
}
