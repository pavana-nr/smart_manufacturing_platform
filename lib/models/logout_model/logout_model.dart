import 'package:json_annotation/json_annotation.dart';
part 'logout_model.g.dart';

@JsonSerializable()
class LogoutModel {
  final int? status;
  final String? message;
  @JsonKey(name: "data")
  final LogoutModelData? data;
  LogoutModel({this.status, this.message, this.data});

  factory LogoutModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutModelToJson(this);
}

@JsonSerializable()
class LogoutModelData {
  LogoutModelData();

  factory LogoutModelData.fromJson(Map<String, dynamic> json) =>
      _$LogoutModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutModelDataToJson(this);
}
