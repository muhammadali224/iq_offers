// To parse this JSON data, do
//
//     final partnerReplacementAwardsModel = partnerReplacementAwardsModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner_replacement_awards_model.freezed.dart';

part 'partner_replacement_awards_model.g.dart';

PartnerReplacementAwardsModel partnerReplacementAwardsModelFromJson(
        String str) =>
    PartnerReplacementAwardsModel.fromJson(json.decode(str));

String partnerReplacementAwardsModelToJson(
        PartnerReplacementAwardsModel data) =>
    json.encode(data.toJson());

@freezed
class PartnerReplacementAwardsModel with _$PartnerReplacementAwardsModel {
  const factory PartnerReplacementAwardsModel({
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
  }) = _PartnerReplacementAwardsModel;

  factory PartnerReplacementAwardsModel.fromJson(Map<String, dynamic> json) =>
      _$PartnerReplacementAwardsModelFromJson(json);
}
