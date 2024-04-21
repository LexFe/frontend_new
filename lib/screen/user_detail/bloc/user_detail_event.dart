part of 'user_detail_bloc.dart';

sealed class UserDetailEvent extends Equatable {
  const UserDetailEvent();

  @override
  List<Object> get props => [];
}

class ChangeName extends UserDetailEvent {
  final String name;
  const ChangeName({
    required this.name,
  });

  @override
  List<Object> get props => [name];
}

class ChangePhone extends UserDetailEvent {
  final String phone;
  const ChangePhone({
    required this.phone,
  });

  @override
  List<Object> get props => [phone];
}

class ChangePregnancies extends UserDetailEvent {
  final int pregnancies;
  const ChangePregnancies({
    required this.pregnancies,
  });

  @override
  List<Object> get props => [pregnancies];
}

class ChangeGlucose extends UserDetailEvent {
  final int glucose;
  const ChangeGlucose({
    required this.glucose,
  });

  @override
  List<Object> get props => [glucose];
}


class ChangeBloodPressure extends UserDetailEvent {
  final int bloodPressure;
  const ChangeBloodPressure({
    required this.bloodPressure,
  });

  @override
  List<Object> get props => [bloodPressure];
}


class ChangeSkinThickness extends UserDetailEvent {
  final int skinThickness;
  const ChangeSkinThickness({
    required this.skinThickness,
  });

  @override
  List<Object> get props => [skinThickness];
}

class ChangeInsulin extends UserDetailEvent {
  final int insulin;
  const ChangeInsulin({
    required this.insulin,
  });

  @override
  List<Object> get props => [insulin];
}

class ChangeBmi extends UserDetailEvent {
  final double bmi;
  const ChangeBmi({
    required this.bmi,
  });

  @override
  List<Object> get props => [bmi];
}

class ChangeAge extends UserDetailEvent {
  final int age;
  const ChangeAge({
    required this.age,
  });

  @override
  List<Object> get props => [age];
}

class ChangeDiabetesPedigreeFunction extends UserDetailEvent {
  final double diabetesPedigreeFunction;
  const ChangeDiabetesPedigreeFunction({
    required this.diabetesPedigreeFunction,
  });

  @override
  List<Object> get props => [diabetesPedigreeFunction];
}




