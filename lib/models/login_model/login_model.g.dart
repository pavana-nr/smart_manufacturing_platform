// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : LoginModelData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

LoginModelData _$LoginModelDataFromJson(Map<String, dynamic> json) =>
    LoginModelData(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      employeeId: json['employeeId'] as String,
      department: json['department'] as String,
      role: json['role'] as String,
      assignStationId: (json['assignStationId'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      location:
          (json['location'] as List<dynamic>).map((e) => e as String).toList(),
      line: (json['line'] as List<dynamic>).map((e) => e as String).toList(),
      plants:
          (json['plants'] as List<dynamic>).map((e) => e as String).toList(),
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      createdAt: json['createdAt'] as String?,
      lastUpdatedAt: json['lastUpdatedAt'] as String?,
    );

Map<String, dynamic> _$LoginModelDataToJson(LoginModelData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'employeeId': instance.employeeId,
      'phone': instance.phone,
      'email': instance.email,
      'department': instance.department,
      'role': instance.role,
      'assignStationId': instance.assignStationId,
      'location': instance.location,
      'plants': instance.plants,
      'line': instance.line,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'createdAt': instance.createdAt,
      'lastUpdatedAt': instance.lastUpdatedAt,
    };
