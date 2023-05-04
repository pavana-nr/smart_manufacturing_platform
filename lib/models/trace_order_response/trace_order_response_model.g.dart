// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trace_order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TraceOrderResponseModel _$TraceOrderResponseModelFromJson(
        Map<String, dynamic> json) =>
    TraceOrderResponseModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              TraceOrderResponseModelData.fromJson(e as Map<String, dynamic>))
          .toList(),
      responseTime: json['responseTime'] as int?,
      totalCount: json['totalCount'] as int?,
      txId: json['txId'] as String?,
    );

Map<String, dynamic> _$TraceOrderResponseModelToJson(
        TraceOrderResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'responseTime': instance.responseTime,
      'txId': instance.txId,
      'totalCount': instance.totalCount,
    };

TraceOrderResponseModelData _$TraceOrderResponseModelDataFromJson(
        Map<String, dynamic> json) =>
    TraceOrderResponseModelData(
      id: json['_id'] as String?,
      workorderId: json['workorderId'] as String?,
      workorderFailedQty: json['workorderFailedQty'] as Map<String, dynamic>?,
      workorderPassedQty: json['workorderPassedQty'] as Map<String, dynamic>?,
      workorderProcessedQty:
          json['workorderProcessedQty'] as Map<String, dynamic>?,
      workorderTotalQty: json['workorderTotalQty'] as String?,
      userId: json['userId'] as String?,
      username: json['username'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$TraceOrderResponseModelDataToJson(
        TraceOrderResponseModelData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'workorderId': instance.workorderId,
      'workorderFailedQty': instance.workorderFailedQty,
      'workorderPassedQty': instance.workorderPassedQty,
      'workorderProcessedQty': instance.workorderProcessedQty,
      'workorderTotalQty': instance.workorderTotalQty,
      'userId': instance.userId,
      'username': instance.username,
      'createdAt': instance.createdAt,
    };
