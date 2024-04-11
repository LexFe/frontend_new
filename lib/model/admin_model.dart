import 'dart:convert';

class AdminModel {
    final int? id;
    final String? name;
    final String? phone;
    final String? email;

    AdminModel({
        this.id,
        this.name,
        this.phone,
        this.email,
    });

    factory AdminModel.fromRawJson(String str) => AdminModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
    };
}
