import 'dart:convert';
import 'dart:core';

ModelEbook modelEbookFromJson(String str) =>
    ModelEbook.fromJson(json.decode(str));

String modelEbookToJson(ModelEbook data) => json.encode(data.toJson());

class ModelEbook {
  ModelEbook({
    required this.data,
    required this.totalResult,
  });

  List<ApiModel> data;
  int totalResult;

  factory ModelEbook.fromJson(Map<String, dynamic> json) => ModelEbook(
    data: List<ApiModel>.from(
        json['data'].map((x) => ApiModel.fromJson(x))),
    totalResult: json['totalResult'],
  );

  Map<String, dynamic> toJson() => {
    'data': List<dynamic>.from(data.map((x) => x.toJson())),
    'totalResult': totalResult,
  };
}

class ApiModel {
  ApiModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  final String id;
  final String username;
  final String email;
  final String password;

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
    id: json['id'],
    username: json['username'],
    email: json['email'],
    password: json['password'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'password': password,
  };
}












// import 'package:flutter/cupertino.dart';
//
// class ApiModel{
//   final int id;
//   final String email;
//   final String username;
//   final String password;
//
//   ApiModel({
//     required this.id,
//     required this.username,
//     required this.email,
//     required this.password
// });
//
//   factory ApiModel.fromJson(Map<String, dynamic> json){
//     return ApiModel(
//         id: json['id'],
//         username: json['username'],
//         email: json['email'],
//         password: json['password']);
//   }
// }
//
//
//
//
//
//
//
// // import 'dart:convert';
// //
// // class ApiModel{
// //   int id;
// //   String email;
// //   String username;
// //   String password;
// //
// //   ApiModel({this.id = 0, required this.email, required this.username, required this.password});
// //
// //   factory ApiModel.fromJson(Map<String, dynamic> map){
// //     return ApiModel(
// //         id: map["id"],
// //         email: map["email"],
// //         username: map["username"],
// //         password: map["password"]
// //     );
// //   }
// //
// //   Map<String, dynamic> toJson(){
// //     return {
// //       "id": id,
// //       "email": email,
// //       "username": username,
// //       "password": password
// //     };
// //   }
// //
// //   @override
// //   String toString(){
// //     return 'ApiModel{id: $id, email: $email, username: $username, password: $password}';
// //   }
// // }
// //
// // List<ApiModel> apiModelFromJson(String jsonData){
// //   final data = json.decode(jsonData);
// //   return List<ApiModel>.from(data.map((item) => ApiModel.fromJson(item)));
// // }
// //
// // String profileToJson(ApiModel data){
// //   final jsonData = data.toJson();
// //   return json.encode(jsonData);
// // }