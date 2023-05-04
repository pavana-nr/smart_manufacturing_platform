import 'package:json_annotation/json_annotation.dart';
part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  final int? status;
  final String? message;
  @JsonKey(name: "data")
  final List<SearchModelData>? data;
  final int? responseTime;
  final String? txId;
  SearchModel(
      {this.status, this.message, this.data, this.responseTime, this.txId});

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}

@JsonSerializable()
class SearchModelData {
  final String? conditionId;
  final List<SearchModelValues>? values;
  final int? count;

  SearchModelData({
    required this.conditionId,
    required this.values,
    required this.count,
  });

  factory SearchModelData.fromJson(Map<String, dynamic> json) =>
      _$SearchModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelDataToJson(this);
}

@JsonSerializable()
class SearchModelValues {
  @JsonKey(name: "_id")
  final String searchId;
  final String sn;
  final String id;

  SearchModelValues({
    required this.searchId,
    required this.sn,
    required this.id,
  });

  factory SearchModelValues.fromJson(Map<String, dynamic> json) =>
      _$SearchModelValuesFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelValuesToJson(this);
}

@JsonSerializable()
class SearchModelCount {
  final int totalCount;

  SearchModelCount({required this.totalCount});

  factory SearchModelCount.fromJson(Map<String, dynamic> json) =>
      _$SearchModelCountFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelCountToJson(this);
}
