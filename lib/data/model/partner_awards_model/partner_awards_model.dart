// To parse this JSON data, do
//
//     final partnerAwardsModel = partnerAwardsModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner_awards_model.freezed.dart';

part 'partner_awards_model.g.dart';

PartnerAwardsModel partnerAwardsModelFromJson(String str) =>
    PartnerAwardsModel.fromJson(json.decode(str));

String partnerAwardsModelToJson(PartnerAwardsModel data) =>
    json.encode(data.toJson());

@freezed
class PartnerAwardsModel with _$PartnerAwardsModel {
  const factory PartnerAwardsModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "Description") String? description,
    @JsonKey(name: "Image") String? image,
    @JsonKey(name: "Value") String? value,
    @JsonKey(name: "Expired_Date") DateTime? expiredDate,
    @JsonKey(name: "Start_Date") DateTime? startDate,
    @JsonKey(name: "Status") String? status,
    @JsonKey(name: "SubCategory_Id") String? subCategoryId,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _PartnerAwardsModel;

  factory PartnerAwardsModel.fromJson(Map<String, dynamic> json) =>
      _$PartnerAwardsModelFromJson(json);
}
