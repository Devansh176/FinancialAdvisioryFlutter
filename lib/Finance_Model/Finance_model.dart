import 'dart:convert';

class FinanceModel{
    String name;
    String email;
    String password;

    FinanceModel({required this.name, required this.email, required this.password});

    factory FinanceModel.fromJson(Map<String, dynamic> json) =>
        FinanceModel(
            name: json["name"], email: json["email"], password: json["password"]);

    Map<String, dynamic> toJson() =>
    {
        "name" : name,
        "email" : email,
        "password" : password,
    };

    FinanceModel financeModelJson(String s) => FinanceModel.fromJson(json.decode(s));

    String financeModeltoJson(FinanceModel data) => json.encode(data.toJson());
}