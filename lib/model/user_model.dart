import 'dart:convert';

class UserModel {
  final int? pregnancies;
  final int? id;
  final int? bloodPressure;
  final int? insulin;
  final double? bmi;
  final int? glucose;
  final String? name;
  final int? age;
  final int? skinthickness;
  final double? diabetespedigreefunction;

  UserModel({
    this.pregnancies,
    this.id,
    this.bloodPressure,
    this.insulin,
    this.bmi,
    this.glucose,
    this.name,
    this.age,
    this.skinthickness,
    this.diabetespedigreefunction,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        pregnancies: json["pregnancies"],
        id: json["id"],
        bloodPressure: json["bloodPressure"],
        insulin: json["insulin"],
        bmi: json["bmi"],
        glucose: json["glucose"],
        name: json["name"],
        age: json["age"],
        skinthickness: json["skinthickness"],
        diabetespedigreefunction: json["diabetespedigreefunction"],
      );

  Map<String, dynamic> toJson() => {
        "pregnancies": pregnancies,
        "id": id,
        "bloodPressure": bloodPressure,
        "insulin": insulin,
        "bmi": bmi,
        "glucose": glucose,
        "name": name,
        "age": age,
        "skinthickness": skinthickness,
        "diabetespedigreefunction": diabetespedigreefunction,
      };
}
