// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_full_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkOrderFullDetailsModel _$WorkOrderFullDetailsModelFromJson(
        Map<String, dynamic> json) =>
    WorkOrderFullDetailsModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              WorkOrderFullDetailsModelData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkOrderFullDetailsModelToJson(
        WorkOrderFullDetailsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

WorkOrderFullDetailsModelData _$WorkOrderFullDetailsModelDataFromJson(
        Map<String, dynamic> json) =>
    WorkOrderFullDetailsModelData(
      id: json['id'] as String?,
      aplicationId: json['aplicationId'] as String?,
      datasource: json['datasource'] as String?,
      key: json['key'] as String?,
      lr: json['lr'] as String?,
      rr: json['rr'] as String?,
      tr: json['tr'] as String?,
      br: json['br'] as String?,
      sn: json['sn'] as String?,
      manualEntryCheck: json['manualEntryCheck'] as bool?,
      page: json['page'] as String?,
      plant: json['plant'] as String?,
      location: json['location'] as String?,
      line: json['line'] as String?,
      railType: json['railType'] as String?,
      snKey: json['snKey'] as String?,
      softwareName: json['softwareName'] as String?,
      createdAt: json['createdAt'] as String?,
      softwareVersion: json['softwareVersion'] as String?,
      testResult: json['testResult'] as String?,
      topDataType: json['topdata_type'] as String?,
      userId: json['userId'] as String?,
      username: json['username'] as String?,
      stationId: json['station_id'] as String?,
      workorderId: json['workorderId'] as String?,
    );

Map<String, dynamic> _$WorkOrderFullDetailsModelDataToJson(
        WorkOrderFullDetailsModelData instance) =>
    <String, dynamic>{
      'lr': instance.lr,
      'rr': instance.rr,
      'tr': instance.tr,
      'br': instance.br,
      'sn': instance.sn,
      'location': instance.location,
      'plant': instance.plant,
      'line': instance.line,
      'datasource': instance.datasource,
      'aplicationId': instance.aplicationId,
      'topdata_type': instance.topDataType,
      'station_id': instance.stationId,
      'page': instance.page,
      'manualEntryCheck': instance.manualEntryCheck,
      'id': instance.id,
      'railType': instance.railType,
      'testResult': instance.testResult,
      'workorderId': instance.workorderId,
      'key': instance.key,
      'snKey': instance.snKey,
      'softwareVersion': instance.softwareVersion,
      'username': instance.username,
      'userId': instance.userId,
      'createdAt': instance.createdAt,
      'softwareName': instance.softwareName,
    };
