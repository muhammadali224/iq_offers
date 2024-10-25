// To parse this JSON data, do
//
//     final partnerCouponModel = partnerCouponModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner_coupon_model.freezed.dart';

part 'partner_coupon_model.g.dart';

PartnerCouponModel partnerCouponModelFromJson(String str) =>
    PartnerCouponModel.fromJson(json.decode(str));

String partnerCouponModelToJson(PartnerCouponModel data) =>
    json.encode(data.toJson());

@freezed
class PartnerCouponModel with _$PartnerCouponModel {
  const factory PartnerCouponModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "Description") String? description,
    @JsonKey(name: "Count_Coupon") String? countCoupon,
    @JsonKey(name: "Expired_Date") DateTime? expiredDate,
    @JsonKey(name: "Start_Date") DateTime? startDate,
    @JsonKey(name: "Rate") String? rate,
    @JsonKey(name: "Replacement") String? replacement,
    @JsonKey(name: "SubCategory_Id") String? subCategoryId,
    @JsonKey(name: "Status") String? status,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _PartnerCouponModel;

  factory PartnerCouponModel.fromJson(Map<String, dynamic> json) =>
      _$PartnerCouponModelFromJson(json);
}
