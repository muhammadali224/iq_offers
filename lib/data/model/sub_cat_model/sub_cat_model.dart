// To parse this JSON data, do
//
//     final subCatModel = subCatModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'sub_cat_model.freezed.dart';
part 'sub_cat_model.g.dart';

SubCatModel subCatModelFromJson(String str) =>
    SubCatModel.fromJson(json.decode(str));

String subCatModelToJson(SubCatModel data) => json.encode(data.toJson());

@freezed
class SubCatModel with _$SubCatModel {
  const factory SubCatModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "Name") String? name,
    @JsonKey(name: "Image") String? image,
    @JsonKey(name: "City_Id") String? cityId,
    @JsonKey(name: "Status") String? status,
    @JsonKey(name: "Active") String? active,
    @JsonKey(name: "CityName") String? cityName,
    @JsonKey(name: "TotalRating") num? totalRating,
  }) = _SubCatModel;

  factory SubCatModel.fromJson(Map<String, dynamic> json) =>
      _$SubCatModelFromJson(json);
}
