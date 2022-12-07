import 'dart:convert';

List<DataDummy> dataDummyFromJson(String str) => List<DataDummy>.from(json.decode(str).map((x) => DataDummy.fromJson(x)));

String dataDummyToJson(List<DataDummy> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataDummy {
  DataDummy({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
  });

  String id;
  String email;
  String username;
  String password;

  factory DataDummy.fromJson(Map<String, dynamic> json) => DataDummy(
    id: json["id"],
    email: json["email"],
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "username": username,
    "password": password,
  };
}
