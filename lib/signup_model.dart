import 'dart:convert';

dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DaftarResponseModel {
  late final String? message;
  late final String? errorInfo;

  DaftarResponseModel({this.message, this.errorInfo});

  factory DaftarResponseModel.fromJson(Map<String, dynamic> json) {
    return DaftarResponseModel(
        message: json['message'] != null ? json['message'] : "",
        errorInfo: json['error'] != null ? json['error'] : "");
  }
}
class DataModel {
  late String? username;
  late String? job;
  late String? datebirth;
  late String? email;
  late String? password;

  DataModel(
      {this.username, this.job, this.datebirth, this.email, this.password});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    username: json['username'],
    job: json['job'],
    datebirth: json['datebirth'],
    email: json['email'],
    password: json['password'],
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username?.trim(),
      'job': job?.trim(),
      'datebirth': datebirth?.trim(),
      'email': email?.trim(),
      'password': password?.trim(),
    };
    return map;
  }
}
