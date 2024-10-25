// To parse this JSON data, do
//
//     final advertisementModel = advertisementModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'advertisement_model.freezed.dart';
part 'advertisement_model.g.dart';

AdvertisementModel advertisementModelFromJson(String str) =>
    AdvertisementModel.fromJson(json.decode(str));

String advertisementModelToJson(AdvertisementModel data) =>
    json.encode(data.toJson());

@freezed
class AdvertisementModel with _$AdvertisementModel {
  const factory AdvertisementModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "Description") String? description,
    @JsonKey(name: "Image") String? image,
    @JsonKey(name: "Price") String? price,
    @JsonKey(name: "Start") DateTime? start,
    @JsonKey(name: "End") DateTime? end,
    @JsonKey(name: "SubCategory_Id") dynamic subCategoryId,
    @JsonKey(name: "Status") String? status,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _AdvertisementModel;

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementModelFromJson(json);
}
