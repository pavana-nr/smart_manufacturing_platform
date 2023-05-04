import 'package:json_annotation/json_annotation.dart';
part 'trace_order_response_model.g.dart';

@JsonSerializable()
class TraceOrderResponseModel {
  final int? status;
  final String? message;
  @JsonKey(name: "data")
  final List<TraceOrderResponseModelData>? data;
  final int? responseTime;
  final String? txId;
  final int? totalCount;
  TraceOrderResponseModel(
      {this.status,
      this.message,
      this.data,
      this.responseTime,
      this.totalCount,
      this.txId});

  factory TraceOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TraceOrderResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TraceOrderResponseModelToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'data': data,
      'totalCount': totalCount,
    };
  }
}

@JsonSerializable()
class TraceOrderResponseModelData {
  @JsonKey(name: "_id")
  final String? id;
  final String? workorderId;
  final Map<String, dynamic>? workorderFailedQty;
  final Map<String, dynamic>? workorderPassedQty;
  final Map<String, dynamic>? workorderProcessedQty;
  final String? workorderTotalQty;
  final String? userId;
  final String? username;
  final String? createdAt;

  TraceOrderResponseModelData(
      {this.id,
      this.workorderId,
      this.workorderFailedQty,
      this.workorderPassedQty,
      this.workorderProcessedQty,
      this.workorderTotalQty,
      this.userId,
      this.username,
      this.createdAt});

  factory TraceOrderResponseModelData.fromJson(Map<String, dynamic> json) =>
      _$TraceOrderResponseModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$TraceOrderResponseModelDataToJson(this);

  void toList() {}
}
