// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SearchModelData.fromJson(e as Map<String, dynamic>))
          .toList(),
      responseTime: json['responseTime'] as int?,
      txId: json['txId'] as String?,
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'responseTime': instance.responseTime,
      'txId': instance.txId,
    };

SearchModelData _$SearchModelDataFromJson(Map<String, dynamic> json) =>
    SearchModelData(
      conditionId: json['conditionId'] as String?,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => SearchModelValues.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int?,
    );

Map<String, dynamic> _$SearchModelDataToJson(SearchModelData instance) =>
    <String, dynamic>{
      'conditionId': instance.conditionId,
      'values': instance.values,
      'count': instance.count,
    };

SearchModelValues _$SearchModelValuesFromJson(Map<String, dynamic> json) =>
    SearchModelValues(
      searchId: json['_id'] as String,
      sn: json['sn'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$SearchModelValuesToJson(SearchModelValues instance) =>
    <String, dynamic>{
      '_id': instance.searchId,
      'sn': instance.sn,
      'id': instance.id,
    };

SearchModelCount _$SearchModelCountFromJson(Map<String, dynamic> json) =>
    SearchModelCount(
      totalCount: json['totalCount'] as int,
    );

Map<String, dynamic> _$SearchModelCountToJson(SearchModelCount instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };
