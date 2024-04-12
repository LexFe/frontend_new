part of 'admin_detail_bloc.dart';

 class AdminDetailState extends Equatable {
  final String name;
  final String phone;
  final String email;
  final String password;
  const AdminDetailState({
    this.name = '',
    this.phone = '',
    this.email = '',
    this.password = '',
  });

  AdminDetailState copyWith({
    String? name,
    String? phone,
    String? email,
    String? password,
  }) {
    return AdminDetailState(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
  
  @override
  List<Object> get props => [ name, phone, email, password];
}

