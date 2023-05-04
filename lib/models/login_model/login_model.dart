import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  final int? status;
  final String? message;
  @JsonKey(name: "data")
  final LoginModelData? data;
  LoginModel({this.status, this.message, this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable()
class LoginModelData {
  final String id;
  final String name;
  final String employeeId;
  final String phone;
  final String email;
  final String department;
  String role;
  List<String> assignStationId;
  List<String> location;
  List<String> plants;
  List<String> line;
  @JsonKey(name: "access_token")
  final String? accessToken;
  @JsonKey(name: "refresh_token")
  final String? refreshToken;
  final String? createdAt;
  final String? lastUpdatedAt;
  LoginModelData(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.employeeId,
      required this.department,
      required this.role,
      required this.assignStationId,
      required this.location,
      required this.line,
      required this.plants,
      required this.accessToken,
      required this.refreshToken,
      required this.createdAt,
      required this.lastUpdatedAt});

  factory LoginModelData.fromJson(Map<String, dynamic> json) =>
      _$LoginModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelDataToJson(this);
}
