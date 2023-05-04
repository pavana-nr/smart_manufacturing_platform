import 'package:json_annotation/json_annotation.dart';
part 'work_order_full_details_model.g.dart';

@JsonSerializable()
class WorkOrderFullDetailsModel {
  final int? status;
  final String? message;
  @JsonKey(name: "data")
  final List<WorkOrderFullDetailsModelData> data;
  WorkOrderFullDetailsModel({this.status, this.message, required this.data});

  factory WorkOrderFullDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderFullDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderFullDetailsModelToJson(this);
}

@JsonSerializable()
class WorkOrderFullDetailsModelData {
  final String? lr;
  final String? rr;
  final String? tr;
  final String? br;
  final String? sn;
  final String? location;
  final String? plant;
  final String? line;
  final String? datasource;
  final String? aplicationId;
  @JsonKey(name: "topdata_type")
  final String? topDataType;
  @JsonKey(name: "station_id")
  final String? stationId;
  final String? page;
  final bool? manualEntryCheck;
  final String? id;
  final String? railType;
  final String? testResult;
  final String? workorderId;
  final String? key;
  final String? snKey;
  final String? softwareVersion;
  final String? username;
  final String? userId;
  final String? createdAt;
  final String? softwareName;

  WorkOrderFullDetailsModelData(
      {required this.id,
      required this.aplicationId,
      required this.datasource,
      required this.key,
      required this.lr,
      required this.rr,
      required this.tr,
      required this.br,
      required this.sn,
      required this.manualEntryCheck,
      required this.page,
      required this.plant,
      required this.location,
      required this.line,
      required this.railType,
      required this.snKey,
      required this.softwareName,
      required this.createdAt,
      required this.softwareVersion,
      required this.testResult,
      required this.topDataType,
      required this.userId,
      required this.username,
      required this.stationId,
      required this.workorderId});

  factory WorkOrderFullDetailsModelData.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderFullDetailsModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderFullDetailsModelDataToJson(this);
}
