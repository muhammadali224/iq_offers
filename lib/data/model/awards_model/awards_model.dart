// To parse this JSON data, do
//
//     final awardsModel = awardsModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'awards_model.freezed.dart';

part 'awards_model.g.dart';

AwardsModel awardsModelFromJson(String str) =>
    AwardsModel.fromJson(json.decode(str));

String awardsModelToJson(AwardsModel data) => json.encode(data.toJson());

@freezed
class AwardsModel with _$AwardsModel {
  const factory AwardsModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "CountReplacement") int? countReplacement,
    @JsonKey(name: "Description") String? description,
    @JsonKey(name: "Image") String? image,
    @JsonKey(name: "Value") String? value,
    @JsonKey(name: "Expired_Date") DateTime? expiredDate,
    @JsonKey(name: "Start_Date") DateTime? startDate,
    @JsonKey(name: "SubCategoryName") String? subCategoryName,
    @JsonKey(name: "SubCategoryImage") String? subCategoryImage,
    @JsonKey(name: "SubCategoryId") int? subCategoryId,
    @JsonKey(name: "Status") String? status,
  }) = _AwardsModel;

  factory AwardsModel.fromJson(Map<String, dynamic> json) =>
      _$AwardsModelFromJson(json);
}
