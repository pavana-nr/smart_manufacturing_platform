// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutModel _$LogoutModelFromJson(Map<String, dynamic> json) => LogoutModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : LogoutModelData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LogoutModelToJson(LogoutModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

LogoutModelData _$LogoutModelDataFromJson(Map<String, dynamic> json) =>
    LogoutModelData();

Map<String, dynamic> _$LogoutModelDataToJson(LogoutModelData instance) =>
    <String, dynamic>{};
